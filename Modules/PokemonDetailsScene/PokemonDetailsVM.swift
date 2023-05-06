//
//  PokemonDetailsVM.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import UIKit

final class PokemonDetailsVM: PokemonDetailsVMProtocol {
    
    private weak var coordinator: PokemonDetailsCoordinatorProtocol?
    
    private var pokemon: PokemonResult
    
    init(coordinator: PokemonDetailsCoordinatorProtocol,
         pokemon: PokemonResult) {
        self.coordinator = coordinator
        self.pokemon = pokemon
    }
    
    func finish(shouldMovetoParentVC: Bool) {
        coordinator?.finish(shouldMovetoParentVC)
    }
    
}
