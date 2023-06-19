//
//  PokemonDetailsVC.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import UIKit

final class PokemonDetailsVC: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .insetGrouped)
        tableView.backgroundColor = .mainWhite
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
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
        viewModel.setupAdapter(with: tableView)
        viewModel.loadPokemonDetails()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if isMovingFromParent {
            viewModel.finish(shouldMovetoParentVC: true)
        }
    }
    
    private func setupViewsAndConstraints() {
        title = viewModel.pokemon.name.capitalized
        view.backgroundColor = .mainWhite
        
        view.addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
