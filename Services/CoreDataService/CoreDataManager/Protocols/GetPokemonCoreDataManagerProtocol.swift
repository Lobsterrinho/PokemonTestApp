//
//  GetPokemonCoreDataManagerProtocol.swift
//  PokemonTestApp
//
//  Created by Lobster on 12.05.23.
//

import Foundation

protocol GetPokemonCoreDataManagerProtocol {
 
    func getPokemonList(completion: @escaping ([PokemonResult]) -> Void)
}
