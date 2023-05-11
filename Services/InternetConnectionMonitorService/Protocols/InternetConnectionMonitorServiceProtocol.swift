//
//  InternetConnectionMonitorServiceProtocol.swift
//  PokemonTestApp
//
//  Created by Lobster on 11.05.23.
//

import Foundation

protocol InternetConnectionMonitorServiceProtocol {
    
//    func checkForInternetConnection() -> Bool
    func checkInternetConnection(completion: @escaping (Bool) -> Void)
}
