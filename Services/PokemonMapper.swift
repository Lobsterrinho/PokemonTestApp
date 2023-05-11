//
//  PokemonMapper.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import UIKit

struct PokemonMapper {
    
    static func map(_ model: PokemonListModel) -> [PokemonResult] {
        let newArray: [PokemonResult] = model.results.map { result in
            return PokemonResult(name: result.name, url: result.url)
        }
        return newArray
    }
    
    static func mapCoreData(_ model: [PokemonList]) -> [PokemonResult] {
        let newArray: [PokemonResult] = model.map { result in
            return PokemonResult(name: result.name, url: result.url)
        }
        return newArray
    }
}
