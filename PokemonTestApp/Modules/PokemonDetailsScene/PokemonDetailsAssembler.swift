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
    
    static func makeVC(
        coordinator: PokemonDetailsCoordinatorProtocol,
        container: Container,
        pokemon: PokemonResult
    ) -> UIViewController {
        let viewModel = makeVM(coordinator: coordinator,
                               container: container,
                               pokemon: pokemon)
        
        return PokemonDetailsVC(viewModel: viewModel)
    }
    
    private static func makeVM(
        coordinator: PokemonDetailsCoordinatorProtocol,
        container: Container,
        pokemon: PokemonResult
    ) -> PokemonDetailsVMProtocol {
        
        let networkService: NetworkServiceProtocol = container.resolve()
        let adapter = PokemonDetailsAdapter()
        
        return PokemonDetailsVM(
            coordinator: coordinator,
            networkService: networkService,
            adapter: adapter,
            pokemon: pokemon)
    }
}
