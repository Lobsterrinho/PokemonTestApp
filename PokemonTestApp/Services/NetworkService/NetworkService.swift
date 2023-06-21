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
    
    private let coreDataManager: SavePokemonCoreDataManagerProtocol
    
    private var networkSession: NetworkSessionProtocol
    
    private let internetConnectionMonitor: InternetConnectionMonitorServiceProtocol
    
    init(networkSession: NetworkSessionProtocol,
         internetConnectionMonitor: InternetConnectionMonitorServiceProtocol,
         coreDataManager: SavePokemonCoreDataManagerProtocol) {
        self.networkSession = networkSession
        self.internetConnectionMonitor = internetConnectionMonitor
        self.coreDataManager = coreDataManager
    }
    
    private var currentPage = 0
    private let itemsPerPage = 20
    
    // MARK: Method to get 20 pokemons
    func getPockemonsList(
        completion: @escaping ListResultHandler
    ) {
        let offset = currentPage * itemsPerPage
        
        let endpoint = URLEndpoint.pokemonsList(itemsPerPage: itemsPerPage, offset: offset)
        
        internetConnectionMonitor.checkInternetConnection { isConnected in
            if isConnected {
                NetworkService.createRequest(
                    with: endpoint.url,
                    type: .GET
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
                                self.coreDataManager.savePokemonList(
                                    pokemonListModel: pokemons
                                )
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
        pokemonName: String,
        completion: @escaping DetailsResultHandler
    ) {
        
        let endpoint = URLEndpoint.pokemonDetails(pokemonName: pokemonName)
        
        internetConnectionMonitor.checkInternetConnection { isConnected in
            if isConnected {
                NetworkService.createRequest(
                    with: endpoint.url,
                    type: .GET
                ) { request in
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
