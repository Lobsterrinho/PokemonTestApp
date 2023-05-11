//
//  PokemonListVM.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import Foundation
import UIKit

final class PokemonListVM: PokemonListVMProtocol {
    
    private weak var coordinator: PokemonListCoordinatorProtocol?
    private var adapter: PokemonListAdapterProtocol
    private var networkService: NetworkServiceProtocol
    private var alertFactory: AlertControllerFactoryProtocol
    private weak var delegate: ViewModelDelegate?
    private var pokemons: [PokemonResult] = []
    
    init(coordinator: PokemonListCoordinatorProtocol,
         adapter: PokemonListAdapterProtocol,
         networkService: NetworkServiceProtocol,
         alertFactory: AlertControllerFactoryProtocol) {
        self.coordinator = coordinator
        self.adapter = adapter
        self.networkService = networkService
        self.alertFactory = alertFactory
        adapter.setupAdapterActionDelegate(self)
        adapter.setupPokemonListLastCellDelegate(self)
    }
    
    func setupViewModelDelegate(_ delegate: ViewModelDelegate) {
        self.delegate = delegate
    }
    
    
    func setupAdapter(with tableView: UITableView) {
        adapter.setupTableView(tableView)
    }
    
    func setupPokemons() {
        adapter.setupPokemons(pokemons)
    }
    
    func loadPokemons() {
        networkService.getPockemonsList { result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(message: "\(error.localizedDescription)")
                }
            case .success(let pokemonsListModel):
                DispatchQueue.main.async {
                    self.pokemons.append(
                        contentsOf: PokemonMapper.map(pokemonsListModel)
                    )
                    self.setupPokemons()
                    self.delegate?.cellsDidLoaded()
                }
            }
        }
    }
    
    private func showAlert(message: String) {
        let alert = alertFactory.makeAlert(
            title: "Error",
            message: message,
            actions: [
                .cancel({ }),
            ]
        )
        coordinator?.presentAlert(alert)
    }
    
}

extension PokemonListVM: PokemonListAdapterActionDelegate {
    
    func didSelectItem(pokemon: PokemonResult) {
        coordinator?.openPokemonDetailsScene(pokemon: pokemon)
    }
}

extension PokemonListVM: PokemonListLastCellDelegate {
    
    func didScrolledToLastCell() {
        loadPokemons()
    }
}
