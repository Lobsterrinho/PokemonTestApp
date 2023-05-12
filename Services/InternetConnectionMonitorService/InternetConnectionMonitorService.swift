//
//  InternetConnectionMonitorService.swift
//  PokemonTestApp
//
//  Created by Lobster on 11.05.23.
//

import Foundation
import Network

final class InternetConnectionMonitorService: InternetConnectionMonitorServiceProtocol {
    
    private var monitor: NWPathMonitor
    
    init() {
        self.monitor = NWPathMonitor()
    }
    
    func checkInternetConnection(completion: @escaping (Bool) -> Void) {
        self.monitor.start(queue: DispatchQueue.global(qos: .background))
        self.monitor.pathUpdateHandler = { path in
            completion(path.status == .satisfied)
        }
    }
}
