//
//  PokemonListModel.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import Foundation

struct PokemonListModel: Decodable {
    let results: [Result]
    
    struct Result: Decodable {
        let name: String
        let url: String
    }
}

