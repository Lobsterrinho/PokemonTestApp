//
//  PokemonDetailsVC.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import UIKit

final class PokemonDetailsVC: UIViewController {
    
    private weak var tableView: UITableView!
    
    private var viewModel: PokemonDetailsVMProtocol
    
    init(viewModel: PokemonDetailsVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupViewsAndConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if isMovingFromParent {
            viewModel.finish(shouldMovetoParentVC: true)
        }
    }
    
    private func setupViewsAndConstraints() {
        title = viewModel.pokemon.name.capitalized
        view.backgroundColor = .mainWhite
        
        setupTableView()
        setupTableViewConstraints()
    }
    
    private func setupItemsFromModel() {
        viewModel.loadPokemonDetails { pokemonModel in
            
        }
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
