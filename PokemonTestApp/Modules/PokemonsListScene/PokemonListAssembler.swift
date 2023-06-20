//
//  PokemonListAssembler.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import Foundation
import UIKit

final class PokemonListAssembler {
    
    private init() { }
    
    static func makeVC(
        coordinator: PokemonListCoordinatorProtocol,
        container: Container
    ) -> UIViewController {
        let viewModel = makeVM(coordinator: coordinator,
                               container: container)
        
        return PokemonListVC(viewModel: viewModel)
    }
    
    private static func makeVM(
        coordinator: PokemonListCoordinatorProtocol,
        container: Container
    ) -> PokemonListVMProtocol {
        let adapter = PokemonListAdapter()
        let networkService: NetworkServiceProtocol = container.resolve()
        let alertFactory: AlertFactoryProtocol = container.resolve()
        let coreDataManager: CoreDataManagerProtocol = container.resolve()
        
        return PokemonListVM(coordinator: coordinator,
                             adapter: adapter,
                             networkService: networkService,
                             alertFactory: alertFactory,
                             coreDataManager: coreDataManager)
    }
    
}
