//
//  PokemonListTableCell.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import Foundation
import UIKit

final class PokemonListTableCell: UITableViewCell {
    
    private weak var titleLabel: UILabel!
    private weak var iconImage: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(pokemonName: String) {
        titleLabel.text = pokemonName.capitalized
    }
    
    private func setupViewsAndConstraints() {
        
        setupIconImage()
        setupIconImageConstraints()
        
        setupTitleLable()
        setupTitleLableConstraints()
    }
    
    private func setupIconImage() {
        let iconImage = UIImageView()
        iconImage.image = UIImage(named: "pokeballTableIcon")
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconImage)
        self.iconImage = iconImage
    }
    
    private func setupTitleLable() {
        let label = UILabel()
        label.text = "Label"
        label.font = UIFont.systemFont(ofSize: 20.0,
                                       weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        self.titleLabel = label
    }
    
    private func setupIconImageConstraints() {
        NSLayoutConstraint.activate([
            iconImage.widthAnchor.constraint(equalToConstant: 30.0),
            iconImage.topAnchor.constraint(equalTo: self.topAnchor,
                                           constant: 10.0),
            iconImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                               constant: 20.0),
            iconImage.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                              constant: -10.0)
        ])
    }
    
    private func setupTitleLableConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                            constant: 10.0),
            titleLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor,
                                                constant: 10.0),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                 constant: -20.0),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                               constant: -10.0)
        ])
    }
    
}
