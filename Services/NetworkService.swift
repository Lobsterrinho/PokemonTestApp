//
//  NetworkService.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import UIKit
import Foundation

typealias ResultHandler = (Result<PokemonListModel, Error>) -> Void

final class NetworkService: NetworkServiceProtocol {
    
    func getPockemonsList(completion: @escaping ResultHandler) {
         guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=20&offset=0")
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
            }
        }.resume()
    }
    
}
