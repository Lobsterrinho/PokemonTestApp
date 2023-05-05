//
//  PokemonListAdapter.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import Foundation
import UIKit

final class PokemonListAdapter: NSObject, PokemonListAdapterProtocol {
    
    private var tableView: UITableView?
    
    func setupTableView(_ tableView: UITableView) {
        self.tableView = tableView
    }
    
    private func setupTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
}

//MARK: - UITableViewDataSource

extension PokemonListAdapter: UITableViewDataSource {
    #warning("change to number from enum")
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

//MARK: - UITableViewDelegate

extension PokemonListAdapter: UITableViewDelegate {
    
}
