//
//  LoaderTableCellPrototype.swift
//  PokemonTestApp
//
//  Created by Lobster on 7.05.23.
//

import UIKit

final class LoaderTableCellPrototype: UITableViewCell {
    
    private weak var activityIndicator: UIActivityIndicatorView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewsAndConstraints()
        startIndicatorAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func startIndicatorAnimation() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    private func setupViewsAndConstraints() {
        
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        setupActivityIndicator()
        setupActivityIndicatorConstraints()
    }
    
    private func setupActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        self.activityIndicator = activityIndicator
    }
    
    private func setupActivityIndicatorConstraints() {
        let widthOrHeight = self.frame.height - 20
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            activityIndicator.widthAnchor.constraint(equalToConstant: widthOrHeight),
            activityIndicator.heightAnchor.constraint(equalToConstant: widthOrHeight),
            activityIndicator.topAnchor.constraint(equalTo: self.topAnchor,
                                                   constant: 10.0),
            activityIndicator.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                      constant: -10.0)
        ])
    }
}
