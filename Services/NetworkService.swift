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
    
    private var currentPage = 0
    private let itemsPerPage = 20
    
    func getPockemonsList(completion: @escaping ListResultHandler) {
        let offset = currentPage * itemsPerPage
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=\(itemsPerPage)&offset=\(offset)")
        else { return }
        var request = URLRequest(url: url)
        request.timeoutInterval = 20.0
        request.httpMethod = "GET"
        
        let task = URLSession.shared
        task.dataTask(with: request) { responseData, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let jsonData = responseData {
                let pokemons = try? JSONDecoder().decode(PokemonListModel.self, from: jsonData)
                completion(.success(pokemons ?? PokemonListModel(results: [])))
                self.currentPage += 1
            }
        }.resume()
    }
    
//    func getPockemonsList(completion: @escaping ListResultHandler) {
//        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=20&offset=0")
//        else { return }
//        var request = URLRequest(url: url)
//        request.timeoutInterval = 20.0
//        request.httpMethod = "GET"
//
//        let task = URLSession.shared
//        task.dataTask(with: request) { responseData, response, error in
//            if let error = error {
//                completion(.failure(error))
//            } else if let jsonData = responseData {
//                let pokemons = try? JSONDecoder().decode(PokemonListModel.self, from: jsonData)
//                completion(.success(pokemons ?? PokemonListModel(results: [])))
//            }
//        }.resume()
//    }
    
    func getPokemonDetails(url: String, completion: @escaping DetailsResultHandler) {
        guard let url = URL(string: url)
        else { return }
        var request = URLRequest(url: url)
        request.timeoutInterval = 20.0
        request.httpMethod = "GET"
        
        let task = URLSession.shared
        task.dataTask(with: request) { responseData, response, error in
            guard let jsonData = responseData, error == nil else { return }
            do {
                let pokemon = try JSONDecoder().decode(PokemonDetailsModel.self, from: jsonData)
                completion(.success(pokemon))
            }
            catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
    
}
