//
//  PokemonDetailsVMProtocol.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import UIKit

protocol PokemonDetailsVMProtocol {
    
    var pokemon: PokemonResult { get }
    func loadPokemonDetails()
    func setupAdapter(with tableView: UITableView)
    func finish(shouldMovetoParentVC: Bool)
}
