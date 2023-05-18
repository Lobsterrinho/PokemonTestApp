//
//  PokemonOfflineAssembler.swift
//  PokemonTestApp
//
//  Created by Lobster on 15.05.23.
//

import UIKit

final class PokemonOfflineAssembler {
    
    private init() { }
    
    static func makeTableViewController(
        coordinator: PokemonOfflineCoordinatorProtocol
    ) -> UITableViewController {
        let viewModel = makeViewModel(coordinator: coordinator)
        return PokemonOfflineVC(viewModel: viewModel)
    }
    
    private static func makeViewModel(
        coordinator: PokemonOfflineCoordinatorProtocol
    ) -> PokemonOfflineVMProtocol {
        return PokemonOfflineVM(coordinator: coordinator,
                                adapter: makeAdapter())
    }
    
    private static func makeAdapter() -> PokemonOfflineAdapterProtocol {
        return PokemonOfflineAdapter()
    }
    
}
