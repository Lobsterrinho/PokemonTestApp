//
//  InternetConnectionMonitorService.swift
//  PokemonTestApp
//
//  Created by Lobster on 11.05.23.
//

import Foundation
import Network

final class InternetConnectionMonitorService: InternetConnectionMonitorServiceProtocol {
    
//    private let monitor = NWPathMonitor()
//    private let queue = DispatchQueue(label: "InternetConnectionMonitor", qos: .userInteractive)
//    private var isConnected = true
//
////    var isInternetAvailable: Bool {
////        checkForInternetConnection()
////        return isConnected
////    }
//
//    func checkForInternetConnection() -> Bool {
//        monitor.pathUpdateHandler = { [weak self] path in
//            if path.status == .satisfied {
//                self?.isConnected = true
//
//            } else {
//                self?.isConnected = false
//            }
//        }
//
//        monitor.start(queue: queue)
//        return self.isConnected
//    }
    
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
