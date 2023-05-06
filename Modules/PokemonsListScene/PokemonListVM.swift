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
    private weak var delegate: ViewModelDelegate?
    private var pokemons: [PokemonResult] = []
    
    init(coordinator: PokemonListCoordinatorProtocol,
         adapter: PokemonListAdapterProtocol,
         networkService: NetworkServiceProtocol) {
        self.coordinator = coordinator
        self.adapter = adapter
        self.networkService = networkService
        adapter.setupAdapterActionDelegate(self)
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
            case .failure(let error): print(error)
            case .success(let pokemonsListModel):
                DispatchQueue.main.async {
                    self.pokemons = PokemonMapper.map(pokemonsListModel)
                    self.setupPokemons()
                    self.delegate?.cellsDidLoaded()
                }
            }
        }
    }
    
}

extension PokemonListVM: PokemonListAdapterActionDelegate {
    
    func didSelectItem(pokemon: PokemonResult) {
        coordinator?.openPokemonDetailsScene(pokemon: pokemon)
    }
}
