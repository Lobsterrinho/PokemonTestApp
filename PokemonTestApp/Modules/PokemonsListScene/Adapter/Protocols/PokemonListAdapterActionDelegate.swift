//
//  PokemonListAdapterActionDelegate.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import Foundation

protocol PokemonListAdapterActionDelegate: AnyObject {
    
    func didSelectItem(pokemon: PokemonResult)
}
