//
//  PokemonListVMProtocol.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import UIKit

protocol PokemonListVMProtocol {
    
    func loadPokemons()
    func setupAdapter(with tableView: UITableView)
}
