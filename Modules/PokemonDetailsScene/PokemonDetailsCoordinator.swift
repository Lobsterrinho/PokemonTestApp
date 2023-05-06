//
//  PokemonDetailsCoordinator.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import UIKit

final class PokemonDetailsCoordinator: Coordinator {
    
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: PokemonDetailsRootCoordinatorProtocol
    
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController,
         rootCoordinator: PokemonDetailsRootCoordinatorProtocol) {
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        assert(false, "Should be open with login, please use start(delegate:)")
    }
    
    func start(pokemon: PokemonResult) {
        let pokemonDetailsVC = PokemonDetailsAssembler.makePokemonDetailsVC(
            coordinator: self,
            pokemon: pokemon
        )
        rootNavigationController.pushViewController(pokemonDetailsVC,
                                                    animated: true)
    }
    
    func finish() {
        rootCoordinator.pokemonDetailsSceneDidFinished(self)
    }
    
}

extension PokemonDetailsCoordinator: PokemonDetailsCoordinatorProtocol {
    
    func finish(_ shouldMovetoParentVC: Bool) {
        if shouldMovetoParentVC {
            rootNavigationController.popViewController(animated: true)
        }
        finish()
    }
}
