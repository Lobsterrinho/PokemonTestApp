//
//  FetchError.swift
//  PokemonTestApp
//
//  Created by Lobster on 10.05.23.
//

import Foundation

enum FetchError: Error {
    case noResponce
    case noInternet
    case badURL
}

extension FetchError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noResponce:
            return "Unable to get pokemons."
        case .noInternet:
            return "No internet connection."
        case .badURL:
            return "Chech for URL correct"
        }
    }
}
