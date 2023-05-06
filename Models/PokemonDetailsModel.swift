//
//  PokemonDetailsModel.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import Foundation

struct PokemonDetailsModel: Decodable {
    let sprites: Sprites
    let types: [Types]
    let weight: Int
    let height: Int
}

struct Sprites: Decodable {
    let front: String
    
    enum CodingKeys: String, CodingKey {
        case front = "front_default"
    }
}

struct Types: Decodable {
    let type: PokemonType
}

struct PokemonType: Decodable {
    let name: String
}
