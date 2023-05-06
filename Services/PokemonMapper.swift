//
//  PokemonMapper.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import UIKit

struct PokemonMapper {
    
    static func map(_ array: PokemonListModel) -> [PokemonResult] {
        let newArray: [PokemonResult] = array.results.map { result in
            return PokemonResult(name: result.name, url: result.url)
        }
        return newArray
    }
}
