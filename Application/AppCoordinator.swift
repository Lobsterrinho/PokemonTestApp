//
//  AppCoordinator.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    private var windowScene: UIWindowScene
    private var window: UIWindow?
    
    var childCoordinators: [Coordinator] = []
    
    init(windowScene: UIWindowScene) {
        self.windowScene = windowScene
    }
    
    func start() {
        openPokemonsListScene()
        window?.makeKeyAndVisible()
    }
    
    func finish() { }
    
    private func openPokemonsListScene() {
        let listWindow = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        listWindow.rootViewController = navigationController
        let pokemonListCoordinator = PokemonListCoordinator(
            rootNavigationController: navigationController,
            rootCoordinator: self
        )
        childCoordinators.append(pokemonListCoordinator)
        pokemonListCoordinator.start()
        window = listWindow
    }
}

extension AppCoordinator: PokemonListRootCoordinatorProtocol {
    func pokemonListSceneDidFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
        start()
    }
    
    
}
