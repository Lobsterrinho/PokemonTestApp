//
//  PokemonOfflineVC.swift
//  PokemonTestApp
//
//  Created by Lobster on 15.05.23.
//

import Foundation
import UIKit

final class PokemonOfflineVC: UITableViewController {
    
    private var viewModel: PokemonOfflineVMProtocol
    
    init(viewModel: PokemonOfflineVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokemons"
        self.tableView = UITableView(frame: .zero, style: .insetGrouped)
        self.tableView.separatorColor = .black
        tableView.backgroundColor = .mainWhite
        viewModel.setupTableView(self.tableView)
    }
    
    
    
}
