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
    private var adapter: PokemonListAdapterProtocol
    
    init(coordinator: PokemonListCoordinatorProtocol,
         adapter: PokemonListAdapterProtocol) {
        self.coordinator = coordinator
        self.adapter = adapter
    }
    
    func setupAdapter(with tableView: UITableView) {
        adapter.setupTableView(tableView)
    }
    
}
