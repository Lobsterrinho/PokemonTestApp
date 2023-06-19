//
//  SceneDelegate.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private var appCoordinator: AppCoordinator?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.appCoordinator = AppCoordinator(windowScene: windowScene)
        appCoordinator?.start()
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        PokemonsCoreDataService.shared.saveContext()
    }
    
    
}

