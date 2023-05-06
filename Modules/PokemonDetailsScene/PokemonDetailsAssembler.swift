//
//  PokemonDetailsAssembler.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import Foundation
import UIKit

final class PokemonDetailsAssembler {
    
    private init() { }
    
    static func makePokemonDetailsVC(
        coordinator: PokemonDetailsCoordinatorProtocol,
        pokemon: PokemonResult
    ) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator,
                                      pokemon: pokemon)
        return PokemonDetailsVC(viewModel: viewModel)
    }
    
    private static func makeViewModel(
        coordinator: PokemonDetailsCoordinatorProtocol,
        pokemon: PokemonResult
    ) -> PokemonDetailsVMProtocol {
        return PokemonDetailsVM(coordinator: coordinator,
                                networkService: makeNetworkService(),
                                adapter: makeAdapter(),
                                pokemon: pokemon)
    }
    
    private static func makeNetworkService() -> NetworkServiceProtocol {
        return NetworkService()
    }
    
    private static func makeAdapter() -> PokemonDetailsAdapterProtocol {
        return PokemonDetailsAdapter()
    }
    
}
