//
//  PokemonOfflineVM.swift
//  PokemonTestApp
//
//  Created by Lobster on 15.05.23.
//

import UIKit

final class PokemonOfflineVM: PokemonOfflineVMProtocol {
    
    private weak var coordinator: PokemonOfflineCoordinatorProtocol?
    private var adapter: PokemonOfflineAdapterProtocol
    
    init(coordinator: PokemonOfflineCoordinatorProtocol,
         adapter: PokemonOfflineAdapterProtocol) {
        self.coordinator = coordinator
        self.adapter = adapter
    }
    
    func setupTableView(_ tableView: UITableView) {
        adapter.setupTableView(tableView)
    }
    
}
