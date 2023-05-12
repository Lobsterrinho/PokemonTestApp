//
//  PokemonImageTableCellVMProtocol.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import UIKit

protocol PokemonImageTableCellVMProtocol {
    
    func prepareForReuse()
    func loadImage(by url: String,
                   handler: @escaping (UIImage?) -> Void)
}
