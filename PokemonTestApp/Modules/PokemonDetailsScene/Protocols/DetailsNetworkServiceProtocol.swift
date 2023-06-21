//
//  DetailsNetworkServiceProtocol.swift
//  PokemonTestApp
//
//  Created by Lobster on 12.05.23.
//

import Foundation

protocol DetailsNetworkServiceProtocol {
    
    func getPokemonDetails(pokemonName: String,
                            completion: @escaping DetailsResultHandler)
}
