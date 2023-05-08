//
//  PokemonListModel.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import Foundation

struct PokemonListModel: Codable {
    let results: [PokemonResult]
    
}

struct PokemonResult: Codable {
    let name: String
    let url: String
}

