//
//  PokemonDetailsTableCell.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import UIKit

final class PokemonDetailsTableCell: UITableViewCell {
    
    private weak var titleLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(option: String) {
        titleLabel.text = option
    }
    
    private func setupViewsAndConstraints() {
        
        setupTitleLable()
        setupTitleLableConstraints()
    }
    
    private func setupTitleLable() {
        let label = UILabel()
        label.text = "Label"
        label.font = UIFont.systemFont(ofSize: 20.0,
                                       weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        self.titleLabel = label
    }
    
    private func setupTitleLableConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                            constant: 10.0),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                constant: 10.0),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                 constant: -20.0),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                               constant: -10.0)
        ])
    }
    
}
