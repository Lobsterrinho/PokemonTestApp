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
    #warning("make another protocol")
    private var networkService: NetworkServiceProtocol
    
    var pokemon: PokemonResult
    
    init(coordinator: PokemonDetailsCoordinatorProtocol,
         networkService: NetworkServiceProtocol,
         pokemon: PokemonResult) {
        self.coordinator = coordinator
        self.networkService = networkService
        self.pokemon = pokemon
    }
    
    func loadPokemonDetails(
        completion: @escaping (PokemonDetailsModel
        ) -> Void) {
        networkService.getPokemonDetails(url: pokemon.url) { result in
            switch result {
            case .failure(let error):
                print(error)
            case.success(let pokemonModel):
                DispatchQueue.main.async {
                    completion(pokemonModel)
                }
            }
        }
    }
    
    func finish(shouldMovetoParentVC: Bool) {
        coordinator?.finish(shouldMovetoParentVC)
    }
    
}
