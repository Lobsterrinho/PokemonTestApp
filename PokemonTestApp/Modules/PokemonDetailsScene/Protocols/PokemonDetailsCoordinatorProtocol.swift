//
//  PokemonDetailsCoordinatorProtocol.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import Foundation

protocol PokemonDetailsCoordinatorProtocol: AnyObject {
    
    func finish()
    func finish(_ shouldMovetoParentVC: Bool)
}
