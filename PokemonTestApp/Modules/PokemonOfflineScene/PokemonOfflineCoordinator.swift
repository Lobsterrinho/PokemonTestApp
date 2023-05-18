//
//  PokemonOfflineCoordinator.swift
//  PokemonTestApp
//
//  Created by Lobster on 15.05.23.
//

import UIKit

final class PokemonOfflineCoordinator: Coordinator {
    
    private var rootNavigationController: UINavigationController
    private var rootCoordinator: PokemonOfflineRootCoordintorProtocol
    
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController,
         rootCoordinator: PokemonOfflineRootCoordintorProtocol) {
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
    }
    
    func start() {
        let viewController = PokemonOfflineAssembler.makeTableViewController(
            coordinator: self
        )
        rootNavigationController.pushViewController(viewController,
                                                    animated: true)
    }
    
    func finish() {
        
    }
}

extension PokemonOfflineCoordinator: PokemonOfflineCoordinatorProtocol {
    
}
