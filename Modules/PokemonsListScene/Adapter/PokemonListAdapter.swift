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
        setupTableView()
    }
    
    private func setupTableView() {
        registerCells()
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = 50.0
    }
    
    private func reloadData() {
        tableView?.reloadData()
    }
    
    private func registerCells() {
        tableView?.register(PokemonListTableCell.self,
                            forCellReuseIdentifier: "\(PokemonListTableCell.self)")
    }
    
}

//MARK: - UITableViewDataSource

extension PokemonListAdapter: UITableViewDataSource {
#warning("change to number from enum")
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(PokemonListTableCell.self)",
                                                 for: indexPath) as? PokemonListTableCell
        cell?.setup()
        return cell ?? UITableViewCell()
    }
    
    
}

//MARK: - UITableViewDelegate

extension PokemonListAdapter: UITableViewDelegate {
    
}
