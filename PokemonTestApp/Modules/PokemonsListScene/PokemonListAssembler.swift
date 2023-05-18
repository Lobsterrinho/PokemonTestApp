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
                             alertFactory: makeAlertFactory(),
                             coreDataManager: makeGetCoreData())
    }
    
    private static func makeAdapter() -> PokemonListAdapterProtocol {
        return PokemonListAdapter()
    }
    
    private static func makeNetworkService() -> PokemonListNetworkServiceProtocol {
        return NetworkService(networkSession: URLSession.shared,
                              internetConnectionMonitor: makeInternetConnectionMonitor(), coreDataManager: makeCoreDataManager())
    }
    
    private static func makeAlertFactory() -> AlertControllerFactoryProtocol {
        return AlertControllerFactory()
    }
    
    private static func makeInternetConnectionMonitor(
    ) -> InternetConnectionMonitorServiceProtocol {
        return InternetConnectionMonitorServiceAssembler.makeInternetConnectionMonitorService()
    }
    
    private static func makeCoreDataManager() -> SavePokemonCoreDataManagerProtocol {
        return PokemonCoreDataManager()
    }
    
    private static func makeGetCoreData() -> GetPokemonCoreDataManagerProtocol {
        return PokemonCoreDataManager()
    }
    
}
