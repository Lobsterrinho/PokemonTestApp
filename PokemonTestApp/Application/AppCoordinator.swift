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
        let ud = UserDefaults.standard
        ud.set(true, forKey: "isInternetConnected")
        let isInternetConnected = UserDefaults.standard.bool(forKey: "isInternetConnected")
        if isInternetConnected {
            openPokemonsListScene()
        } else {
            openPokemonsOffline()
        }
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
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.tintColor = .black
        childCoordinators.append(pokemonListCoordinator)
        pokemonListCoordinator.start()
        window = listWindow
    }
    
    private func openPokemonsOffline() {
        let pokemonsWindow = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        pokemonsWindow.rootViewController = navigationController
        let pokemonOfflineCoordinator = PokemonOfflineCoordinator(
            rootNavigationController: navigationController,
            rootCoordinator: self
        )
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.tintColor = .black
        childCoordinators.append(pokemonOfflineCoordinator)
        pokemonOfflineCoordinator.start()
        window = pokemonsWindow
    }
 }

extension AppCoordinator: PokemonListRootCoordinatorProtocol {
    func pokemonListSceneDidFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
        start()
    }
}

extension AppCoordinator: PokemonOfflineRootCoordintorProtocol {
    func pokemonOfflineSceneDidFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
        start()
    }
}
