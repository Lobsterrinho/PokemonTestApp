//
//  PokemonListAdapter.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import Foundation
import UIKit

final class PokemonListAdapter: NSObject, PokemonListAdapterProtocol {
    
    private weak var tableView: UITableView?
    private var pokemons: [PokemonResult] = []
    
    private weak var delegate: PokemonListAdapterActionDelegate?
    private weak var lastCellDelegate: PokemonListLastCellDelegate?
    
    func setupTableView(_ tableView: UITableView) {
        self.tableView = tableView
        setupTableView()
    }
    
    private func setupTableView() {
        registerCells()
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = 50.0
    }
    
    func setupPokemons(_ pokemons: [PokemonResult]) {
        self.pokemons = pokemons
        reloadData()
    }
    
    private func reloadData() {
        tableView?.reloadData()
    }
    
    private func registerCells() {
        tableView?.register(PokemonListTableCell.self,
                            forCellReuseIdentifier: "\(PokemonListTableCell.self)")
        
        tableView?.register(LoaderTableCellPrototype.self,
                            forCellReuseIdentifier: "\(LoaderTableCellPrototype.self)")
    }
    
    func setupAdapterActionDelegate(_ delegate: PokemonListAdapterActionDelegate) {
        self.delegate = delegate
    }
    
    func setupPokemonListLastCellDelegate(_ delegate: PokemonListLastCellDelegate) {
        self.lastCellDelegate = delegate
    }
    
}

//MARK: - UITableViewDataSource

extension PokemonListAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemonCell = tableView.dequeueReusableCell(
            withIdentifier: "\(PokemonListTableCell.self)",
            for: indexPath
        ) as? PokemonListTableCell
        
        let loaderCell = tableView.dequeueReusableCell(
            withIdentifier: "\(LoaderTableCellPrototype.self)",
            for: indexPath
        ) as? LoaderTableCellPrototype
        
        switch indexPath.row {
        case pokemons.count:
            return loaderCell ?? UITableViewCell()
        default:
            let pokemon = pokemons[indexPath.row]
            pokemonCell?.setup(pokemonName: pokemon.name)
            return pokemonCell ?? UITableViewCell()
        }

    }
}

//MARK: - UITableViewDelegate

extension PokemonListAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let pokemon = pokemons[indexPath.row]
        delegate?.didSelectItem(pokemon: pokemon)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastIndex = pokemons.count - 1
        if indexPath.row == lastIndex {
            lastCellDelegate?.didScrolledToLastCell()
        }
    }
}
