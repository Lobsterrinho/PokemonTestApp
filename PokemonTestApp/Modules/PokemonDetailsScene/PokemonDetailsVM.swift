//
//  PokemonDetailsVM.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import Foundation
import UIKit

final class PokemonDetailsVM: PokemonDetailsVMProtocol {
    
    private weak var coordinator: PokemonDetailsCoordinatorProtocol?
    private var networkService: DetailsNetworkServiceProtocol
    private var adapter: PokemonDetailsAdapterProtocol
    
    var pokemon: PokemonResult
    
    init(coordinator: PokemonDetailsCoordinatorProtocol,
         networkService: DetailsNetworkServiceProtocol,
         adapter: PokemonDetailsAdapterProtocol,
         pokemon: PokemonResult) {
        self.coordinator = coordinator
        self.networkService = networkService
        self.adapter = adapter
        self.pokemon = pokemon
    }
    
    func setupAdapter(with tableView: UITableView) {
        adapter.setupTableView(tableView)
    }
    
    private func setupPokemon(_ pokemon: PokemonDetailsModel) {
        adapter.setupPokemon(pokemon)
    }
    
    func loadPokemonDetails() {
        networkService.getPokemonDetails(pokemonName: pokemon.name) { result in
            switch result {
            case .failure(let error):
                print(error)
            case.success(let pokemonModel):
                DispatchQueue.main.async {
                    self.setupPokemon(pokemonModel)
                }
            }
        }
    }
    
    func finish(shouldMovetoParentVC: Bool) {
        coordinator?.finish(shouldMovetoParentVC)
    }
    
}
