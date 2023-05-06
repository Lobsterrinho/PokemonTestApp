//
//  PokemonListVC.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import Foundation
import UIKit

final class PokemonListVC: UIViewController {
    
    private weak var tableView: UITableView!
    
    private var viewModel: PokemonListVMProtocol
    
    init(viewModel: PokemonListVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadPokemons()
        setupViewsAndConstraints()
        viewModel.setupAdapter(with: tableView)
    }
    
    private func setupViewsAndConstraints() {
        
        view.backgroundColor = .mainWhite
        
        setupTableView()
        setupTableViewConstraints()
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: .zero,
                                    style: .insetGrouped)
        tableView.backgroundColor = .mainWhite
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        self.tableView = tableView
    }
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
