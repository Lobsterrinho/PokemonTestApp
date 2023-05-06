//
//  PokemonDetailsVMProtocol.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import Foundation

protocol PokemonDetailsVMProtocol {
    
    var pokemon: PokemonResult { get }
    func loadPokemonDetails( completion: @escaping (PokemonDetailsModel) -> Void)
    func finish(shouldMovetoParentVC: Bool)
}
