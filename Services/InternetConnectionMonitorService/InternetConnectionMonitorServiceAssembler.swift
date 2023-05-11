//
//  InternetConnectionMonitorServiceAssembler.swift
//  PokemonTestApp
//
//  Created by Lobster on 11.05.23.
//

import Foundation

final class InternetConnectionMonitorServiceAssembler {
    
    private init() { }
    
    static func makeInternetConnectionMonitorService(
    ) -> InternetConnectionMonitorServiceProtocol {
        return InternetConnectionMonitorService()
    }
}
