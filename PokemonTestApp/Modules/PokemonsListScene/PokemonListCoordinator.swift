//
//  PokemonListCoordinator.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import Foundation
import UIKit

final class PokemonListCoordinator: Coordinator {
    
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: PokemonListRootCoordinatorProtocol
    
    private var container: Container
    
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController,
         rootCoordinator: PokemonListRootCoordinatorProtocol,
         container: Container) {
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
        self.container = container
    }
    
    func start() {
        let pokemonListViewController = PokemonListAssembler.makeVC(coordinator: self,
                                                                    container: container)
        rootNavigationController.pushViewController(pokemonListViewController,
                                                    animated: false)
    }
    
    func finish() {
        rootNavigationController.popViewController(animated: false)
        rootCoordinator.pokemonListSceneDidFinished(self)
    }
    
}

extension PokemonListCoordinator: PokemonListCoordinatorProtocol {
    
    func presentAlert(_ alert: UIAlertController) {
        rootNavigationController.present(alert, animated: true)
    }
    
    func openPokemonDetailsScene(pokemon: PokemonResult) {
        let pokemonDetailsCoordinator = PokemonDetailsCoordinator(
            rootNavigationController: rootNavigationController,
            rootCoordinator: self,
            container: container
        )
        childCoordinators.append(pokemonDetailsCoordinator)
        pokemonDetailsCoordinator.start(pokemon: pokemon)
    }
    
}

extension PokemonListCoordinator: PokemonDetailsRootCoordinatorProtocol {
    
    func pokemonDetailsSceneDidFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
    }
}
