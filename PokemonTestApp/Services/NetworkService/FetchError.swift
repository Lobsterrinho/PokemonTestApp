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
            return NSLocalizedString(LocalizationConsts.apiError, comment: "") + "."
        case .noInternet:
            return NSLocalizedString(LocalizationConsts.noInternetError, comment: "") + "."
        case .badURL:
            return NSLocalizedString(LocalizationConsts.checkURLError, comment: "") + "."
        }
    }
}
