//
//  PokemonListVC.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import Foundation
import UIKit

final class PokemonListVC: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .insetGrouped)
        tableView.backgroundColor = UIColor(named: GlobalConsts.backgroundColor)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
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
        title = "Pokemons"
        viewModel.loadPokemons()
        setupViewsAndConstraints()
        startIndicatorAnimation()
        viewModel.setupAdapter(with: tableView)
        viewModel.setupViewModelDelegate(self)
    }
    
    private func startIndicatorAnimation() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    private func stopIndicatorAnimation() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    private func setupViewsAndConstraints() {
        
        view.backgroundColor = UIColor(named: GlobalConsts.backgroundColor)
        
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension PokemonListVC: ViewModelDelegate {
    
    func cellsDidLoaded() {
        stopIndicatorAnimation()
    }
}
