//
//  Coordinator.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import Foundation

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get }
    
    func start()
    func finish()
}
