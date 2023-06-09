//
//  PokemonImageTableCell.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import UIKit

final class PokemonImageTableCell: UITableViewCell {
    
    private enum Consts {
        static let heightAndWidth = UITableViewCell().frame.width / 1.5
    }
    
    private weak var pokemonImage: UIImageView!
    private weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: PokemonImageTableCellVMProtocol!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewsAndConstraints()
        startIndicatorAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        pokemonImage.image = nil
        viewModel.prepareForReuse()
    }
    
    func setup(imageURL: String) {
        viewModel.loadImage(by: imageURL) { [weak self] in
            self?.stopIndicatorAnimation()
            self?.pokemonImage.image = $0
        }
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
        
        backgroundColor = UIColor(named: GlobalConsts.backgroundCellColor)
        
        setupPokemonImage()
        setupPokemonImageConstraints()
        
        setupActivityIndicator()
        setupActivityIndicatorConstraints()
    }
    
    private func setupPokemonImage() {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        addSubview(image)
        self.pokemonImage = image
    }
    
    private func setupActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        self.activityIndicator = activityIndicator
    }
    
    private func setupPokemonImageConstraints() {
        NSLayoutConstraint.activate([
            pokemonImage.widthAnchor.constraint(equalToConstant: Consts.heightAndWidth),
            pokemonImage.heightAnchor.constraint(equalToConstant: Consts.heightAndWidth),
            pokemonImage.topAnchor.constraint(equalTo: self.topAnchor,
                                              constant: GlobalConsts.defaultSpaceConstraint),
            pokemonImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pokemonImage.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                 constant: -GlobalConsts.defaultSpaceConstraint)
        ])
    }
    
    private func setupActivityIndicatorConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
        ])
    }
}

