//
//  PokemonOfflineTableCell.swift
//  PokemonTestApp
//
//  Created by Lobster on 17.05.23.
//

import UIKit

final class PokemonOfflineTableCell: UITableViewCell {
    
    private weak var pokemonImage: UIImageView!
    private weak var nameLabel: UILabel!
    private weak var typeLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
    }
    
    private func setupViewsAndConstraints() {
        
        setupPokemonImage()
        setupPokemonImageConstraints()
        
        setupNameLabel()
        setupNameLabelConstraints()
        
        setupTypeLabel()
        setupTypeLabelConstraints()
    }
    
    private func setupPokemonImage() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pokeball")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        self.pokemonImage = imageView
    }
    
    private func setupNameLabel() {
        let label = UILabel()
        label.text = "Name Label"
        label.font = UIFont.systemFont(ofSize: 22.0,
                                       weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        self.nameLabel = label
    }
    
    private func setupTypeLabel() {
        let label = UILabel()
        label.text = "Type"
        label.font = UIFont.systemFont(ofSize: 18.0,
                                       weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        self.typeLabel = label
    }
    
    private func setupPokemonImageConstraints() {
        let widthAndHeight = self.frame.width / 3
        NSLayoutConstraint.activate([
            pokemonImage.heightAnchor.constraint(equalToConstant: widthAndHeight),
            pokemonImage.widthAnchor.constraint(equalToConstant: widthAndHeight),
            pokemonImage.topAnchor.constraint(equalTo: self.topAnchor,
                                              constant: 10.0),
            pokemonImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                              constant: 10.0),
            pokemonImage.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                              constant: -10.0),
        ])
    }
    
    private func setupNameLabelConstraints() {
        NSLayoutConstraint.activate([
           
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                              constant: 10.0),
            nameLabel.leadingAnchor.constraint(equalTo: pokemonImage.trailingAnchor,
                                              constant: 14.0),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                constant: 10.0),
            nameLabel.heightAnchor.constraint(equalToConstant: self.frame.height / 2 - 4)
        ])
    }
    
    private func setupTypeLabelConstraints() {
        NSLayoutConstraint.activate([
           
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,
                                              constant: 8.0),
            typeLabel.leadingAnchor.constraint(equalTo: pokemonImage.trailingAnchor,
                                              constant: 14.0),
            typeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                constant: 10.0),
            typeLabel.heightAnchor.constraint(equalToConstant: self.frame.height / 2 - 4)
        ])
    }
    
}
