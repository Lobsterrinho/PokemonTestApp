//
//  DetailsNetworkServiceProtocol.swift
//  PokemonTestApp
//
//  Created by Lobster on 12.05.23.
//

import Foundation

protocol DetailsNetworkServiceProtocol {
    
    func getPokemonDetails( url: String,
                            completion: @escaping DetailsResultHandler)
}
