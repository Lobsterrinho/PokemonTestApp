//
//  PokemonListAdapterProtocol.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import UIKit

protocol PokemonListAdapterProtocol {
    
    func setupTableView(_ tableView: UITableView)
    func setupPokemons(_ pokemons: [PokemonResult])
    func setupAdapterActionDelegate(_ delegate: PokemonListAdapterActionDelegate)
    func setupPokemonListLastCellDelegate(_ delegate: PokemonListLastCellDelegate)
}
