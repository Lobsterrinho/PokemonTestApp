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
    }
    
    func setupAdapterActionDelegate(_ delegate: PokemonListAdapterActionDelegate) {
        self.delegate = delegate
    }
    
}

//MARK: - UITableViewDataSource

extension PokemonListAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(PokemonListTableCell.self)",
                                                 for: indexPath) as? PokemonListTableCell
        let pokemon = pokemons[indexPath.row]
        cell?.setup(pokemonName: pokemon.name)
        return cell ?? UITableViewCell()
    }
}

//MARK: - UITableViewDelegate

extension PokemonListAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let pokemon = pokemons[indexPath.row]
        delegate?.didSelectItem(pokemon: pokemon)
    }
}
