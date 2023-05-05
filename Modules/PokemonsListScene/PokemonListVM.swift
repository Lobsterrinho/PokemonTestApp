//
//  PokemonListVM.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import Foundation
import UIKit

final class PokemonListVM: PokemonListVMProtocol {
    
    private weak var coordinator: PokemonListCoordinatorProtocol?
    
    init(coordinator: PokemonListCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
}
