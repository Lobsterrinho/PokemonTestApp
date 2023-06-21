//
//  LoaderTableCellPrototype.swift
//  PokemonTestApp
//
//  Created by Lobster on 7.05.23.
//

import UIKit

final class LoaderTableCellPrototype: UITableViewCell {
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
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
        
        addSubview(activityIndicator)
        
        setupConstraints()
    }

    
    private func setupConstraints() {
        let widthOrHeight = self.frame.height - 20
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            activityIndicator.widthAnchor.constraint(equalToConstant: widthOrHeight),
            activityIndicator.heightAnchor.constraint(equalToConstant: widthOrHeight),
            activityIndicator.topAnchor.constraint(equalTo: self.topAnchor,
                                                   constant: GlobalConsts.defaultSpaceConstraint),
            activityIndicator.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                      constant: -GlobalConsts.defaultSpaceConstraint)
        ])
    }
}
