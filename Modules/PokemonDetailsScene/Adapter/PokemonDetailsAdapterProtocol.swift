//
//  PokemonDetailsAdapterProtocol.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import UIKit

protocol PokemonDetailsAdapterProtocol {
    
    func setupTableView(_ tableView: UITableView)
    func setupPokemon(_ pokemon: PokemonDetailsModel)
    func setupAdapterActionDelegate(_ delegate: PokemonListAdapterActionDelegate)
}
