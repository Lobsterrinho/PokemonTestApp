//
//  NetworkServiceProtocol.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import Foundation

protocol NetworkServiceProtocol {
    
    func getPockemonsList(completion: @escaping ResultHandler)
}
