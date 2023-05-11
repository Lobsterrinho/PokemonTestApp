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
    private var isInternetAvailable: Bool = false
    
    private weak var delegate: PokemonListAdapterActionDelegate?
    private weak var lastCellDelegate: PokemonListLastCellDelegate?
    
    func setupTableView(_ tableView: UITableView) {
        self.tableView = tableView
        setupTableView()
    }
    
    private func setupTableView() {
        registerCells()
        if !isInternetAvailable {
            tableView?.allowsSelection = false
        }
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = 50.0
    }
    
    func setupPokemons(_ pokemons: [PokemonResult]) {
        self.pokemons = pokemons
        reloadData()
    }
    
    func isInternetAvailable(_ available: Bool) {
        self.isInternetAvailable = available
    }
    
    private func reloadData() {
        tableView?.reloadData()
    }
    
    private func registerCells() {
        tableView?.register(PokemonListTableCell.self,
                            forCellReuseIdentifier: "\(PokemonListTableCell.self)")
        
        tableView?.register(LoaderTableCellPrototype.self,
                            forCellReuseIdentifier: "\(LoaderTableCellPrototype.self)")
        
        tableView?.register(UITableViewCell.self,
                            forCellReuseIdentifier: "Cell")
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
        
        let standartCell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                         for: indexPath)
        
        switch indexPath.row {
        case pokemons.count:
            if isInternetAvailable {
                return loaderCell ?? UITableViewCell()
            } else {
                standartCell.backgroundColor = .clear
                standartCell.contentView.backgroundColor = .clear
                return standartCell
            }
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
        if isInternetAvailable {
            let lastIndex = pokemons.count - 1
            if indexPath.row == lastIndex {
                lastCellDelegate?.didScrolledToLastCell()
            }
        }
    }
}
