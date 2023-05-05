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
    
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController,
         rootCoordinator: PokemonListRootCoordinatorProtocol) {
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let pokemonListViewController = PokemonListAssembler.makeVC(coordinator: self)
        rootNavigationController.pushViewController(pokemonListViewController,
                                                    animated: false)
    }
    
    func finish() {
        rootNavigationController.popViewController(animated: false)
        rootCoordinator.pokemonListSceneDidFinished(self)
    }
    
}

extension PokemonListCoordinator: PokemonListCoordinatorProtocol {
    
}
