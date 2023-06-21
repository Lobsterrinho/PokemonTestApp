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
        
        backgroundColor = UIColor(named: GlobalConsts.backgroundCellColor)
        
        setupTitleLable()
        setupTitleLableConstraints()
    }
    
    private func setupTitleLable() {
        let label = UILabel()
        label.text = "Label"
        label.font = UIFont.systemFont(ofSize: 20.0,
                                       weight: .regular)
        label.textColor = UIColor(named: GlobalConsts.textColor)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        self.titleLabel = label
    }
    
    private func setupTitleLableConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                            constant: GlobalConsts.defaultSpaceConstraint),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                constant: GlobalConsts.defaultSpaceConstraint),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                 constant: -GlobalConsts.defaultSpaceConstraint),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                               constant: -GlobalConsts.defaultSpaceConstraint)
        ])
    }
}
