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
    private weak var activityIndicator: UIActivityIndicatorView!
    
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
        
        view.backgroundColor = .mainWhite
        
        setupTableView()
        setupTableViewConstraints()
        
        setupActivityIndicator()
        setupActivityIndicatorConstraints()
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: .zero,
                                    style: .insetGrouped)
        tableView.backgroundColor = .mainWhite
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        self.tableView = tableView
    }
    
    private func setupActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        view.bringSubviewToFront(activityIndicator)
        self.activityIndicator = activityIndicator
    }
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupActivityIndicatorConstraints() {
        NSLayoutConstraint.activate([
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
