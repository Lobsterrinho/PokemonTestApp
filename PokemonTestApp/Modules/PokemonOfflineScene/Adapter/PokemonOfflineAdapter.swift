//
//  PokemonOfflineAdapter.swift
//  PokemonTestApp
//
//  Created by Lobster on 15.05.23.
//

import UIKit

final class PokemonOfflineAdapter: NSObject, PokemonOfflineAdapterProtocol {
    
    private var tableView: UITableView?
    
    func setupTableView(_ tableView: UITableView) {
        self.tableView = tableView
        setupTableView()
    }
    
    private func setupTableView() {
        registerCells()
        tableView?.dataSource = self
        
    }
    
    private func registerCells() {
        tableView?.register(PokemonOfflineTableCell.self,
                            forCellReuseIdentifier: "\(PokemonOfflineTableCell.self)")
    }
    
}

extension PokemonOfflineAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "\(PokemonOfflineTableCell.self)",
            for: indexPath
        ) as? PokemonOfflineTableCell
        
        return cell ?? UITableViewCell()
    }
    
}
