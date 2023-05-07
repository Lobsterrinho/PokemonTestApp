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
        coordinator: PokemonListCoordinatorProtocol
    ) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator)
        return PokemonListVC(viewModel: viewModel)
    }
    
    private static func makeViewModel(
        coordinator: PokemonListCoordinatorProtocol
    ) -> PokemonListVMProtocol {
        return PokemonListVM(coordinator: coordinator,
                             adapter: makeAdapter(),
                             networkService: makeNetworkService(),
                             alertFactory: makeAlertFactory())
    }
    
    private static func makeAdapter() -> PokemonListAdapterProtocol {
        return PokemonListAdapter()
    }
    
    private static func makeNetworkService() -> NetworkServiceProtocol {
        return NetworkService()
    }
    
    private static func makeAlertFactory() -> AlertControllerFactoryProtocol {
        return AlertControllerFactory()
    }
    
}
