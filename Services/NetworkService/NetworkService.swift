//
//  NetworkService.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import UIKit
import Foundation

typealias ListResultHandler = (Result<PokemonListModel, Error>) -> Void
typealias DetailsResultHandler = (Result<PokemonDetailsModel, Error>) -> Void


final class NetworkService: NetworkServiceProtocol {
    
    private var networkSession: NetworkSessionProtocol
    
    private let internetConnectionMonitor: InternetConnectionMonitorServiceProtocol
    
    init(networkSession: NetworkSessionProtocol,
         internetConnectionMonitor: InternetConnectionMonitorServiceProtocol) {
        self.networkSession = networkSession
        self.internetConnectionMonitor = internetConnectionMonitor
    }
    
    private var currentPage = 0
    private let itemsPerPage = 20
    
    // MARK: Method to get 20 pokemons
    func getPockemonsList(
        completion: @escaping ListResultHandler
    ) {
        let offset = currentPage * itemsPerPage
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=\(itemsPerPage)&offset=\(offset)")
        internetConnectionMonitor.checkInternetConnection { isConnected in
            if isConnected {
                self.createRequest(
                    with: url,
                    type: .get
                ) { request in
                    self.networkSession.callDataTask(
                        with: request
                    ) { responseData, responce, error in
                        do {
                            if let error = error {
                                throw error
                            } else if let jsonData = responseData {
                                let pokemons = try JSONDecoder().decode(PokemonListModel.self,
                                                                        from: jsonData)
                                completion(.success(pokemons))
                                self.currentPage += 1
                            } else {
                                throw FetchError.noResponce
                            }
                        } catch {
                            completion(.failure(error))
                        }
                    }
                }
            } else {
                let error = FetchError.noInternet
                completion(.failure(error))
            }
        }
    }
    
    // MARK: Method to get pokemon details
    func getPokemonDetails(
        url: String,
        completion: @escaping DetailsResultHandler
    ) {
        guard let url = URL(string: url)
        else { completion(.failure(FetchError.badURL))
            return }
        
        internetConnectionMonitor.checkInternetConnection { isConnected in
            if isConnected {
                self.createRequest(with: url,
                                   type: .get) { request in
                    self.networkSession.callDataTask(
                        with: request
                    )
                    { responseData, response, error in
                        do {
                            if let error = error {
                                throw error
                            } else if let jsonData = responseData {
                                let pokemon = try JSONDecoder().decode(PokemonDetailsModel.self,
                                                                       from: jsonData)
                                completion(.success(pokemon))
                            } else {
                                throw FetchError.noResponce
                            }
                        } catch {
                            completion(.failure(error))
                        }
                    }
                }
            } else {
                let error = FetchError.noInternet
                completion(.failure(error))
            }
        }
    }
}

extension NetworkService {
    
    private func createRequest(with url: URL?, type: HTTPMethod, completion: @escaping (URLRequest) -> Void) {
        guard let apiURL = url else { return }
        var request = URLRequest(url: apiURL)
        request.httpMethod = type.rawValue
        request.timeoutInterval = 20
        completion(request)
    }
    
}