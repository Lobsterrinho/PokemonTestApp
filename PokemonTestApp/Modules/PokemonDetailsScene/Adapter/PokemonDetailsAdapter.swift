//
//  PokemonDetailsAdapter.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import Foundation
import UIKit

final class PokemonDetailsAdapter: NSObject, PokemonDetailsAdapterProtocol {
    
    private weak var tableView: UITableView?
    private var pokemon: PokemonDetailsModel?
    
    private weak var delegate: PokemonListAdapterActionDelegate?
    
    func setupTableView(_ tableView: UITableView) {
        self.tableView = tableView
        setupTableView()
    }
    
    private func setupTableView() {
        registerCells()
        tableView?.allowsSelection = false
        tableView?.dataSource = self
    }
    
    func setupPokemon(_ pokemon: PokemonDetailsModel) {
        self.pokemon = pokemon
        reloadData()
    }
    
    private func reloadData() {
        tableView?.reloadData()
    }
    
    private func registerCells() {
        tableView?.register(PokemonDetailsTableCell.self,
                            forCellReuseIdentifier: "\(PokemonDetailsTableCell.self)")
        
        tableView?.register(PokemonImageTableCell.self,
                            forCellReuseIdentifier: "\(PokemonImageTableCell.self)")
    }
    
    func setupAdapterActionDelegate(_ delegate: PokemonListAdapterActionDelegate) {
        self.delegate = delegate
    }
    
}

//MARK: - UITableViewDataSource

extension PokemonDetailsAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let imageCell = tableView.dequeueReusableCell(
            withIdentifier: "\(PokemonImageTableCell.self)",
            for: indexPath
        ) as? PokemonImageTableCell
        
        let infoCell = tableView.dequeueReusableCell(
            withIdentifier: "\(PokemonDetailsTableCell.self)",
            for: indexPath
        ) as? PokemonDetailsTableCell
        
        guard let types = pokemon?.types.map({ $0.type.name }),
              let imageURL = pokemon?.sprites.front,
              let height = pokemon?.height,
              let weight = pokemon?.weight
        else { return UITableViewCell() }
        
        let typesString = types.joined(separator: ", ")
        
        switch indexPath.row {
        case 0:
            imageCell?.viewModel = PokemonImageTableCellVMAssembler.makeVM()
            imageCell?.setup(imageURL: imageURL)
            return imageCell ?? UITableViewCell()
        case 1:
            let pokemonType = NSLocalizedString(LocalizationConsts.pokemonType,
                                                comment: "")
            infoCell?.setup(option: pokemonType + ": " + typesString)
        case 2:
            let pokemonHeight = NSLocalizedString(LocalizationConsts.pokemonHeight,
                                                comment: "")
            let pokemonCM = NSLocalizedString(LocalizationConsts.pokemonCM,
                                                comment: "")
            infoCell?.setup(option: pokemonHeight + ": " + String(height) + pokemonCM)
        case 3:
            let pokemonWeight = NSLocalizedString(LocalizationConsts.pokemonWeight,
                                                comment: "")
            let pokemonKG = NSLocalizedString(LocalizationConsts.pokemonKG,
                                                comment: "")
            infoCell?.setup(option: pokemonWeight + ": " + String(weight) + pokemonKG)
        default: break
        }
        return infoCell ?? UITableViewCell()
    }
}
