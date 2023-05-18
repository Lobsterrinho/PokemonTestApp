//
//  PokemonListCoordinatorProtocol.swift
//  PokemonTestApp
//
//  Created by Lobster on 5.05.23.
//

import Foundation
import UIKit

protocol PokemonListCoordinatorProtocol: AnyObject {
    
    func finish()
    func openPokemonDetailsScene(pokemon: PokemonResult)
    func presentAlert(_ alert: UIAlertController)
}
