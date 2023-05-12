//
//  PokemonListNetworkServiceProtocol.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import Foundation

protocol PokemonListNetworkServiceProtocol {
    
    func getPockemonsList(completion: @escaping ListResultHandler)
}
