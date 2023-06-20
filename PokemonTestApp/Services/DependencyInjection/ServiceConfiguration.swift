//
//  ServiceConfiguration.swift
//  PokemonTestApp
//
//  Created by Lobster on 19.06.23.
//

import Foundation

final class ServiceConfiguration {
    
    private init() { }
    
    static func configure(container: Container) {
        container.register({ Self.coreDataManager })
        container.register({ Self.internetConnetionMonitor })
        container.register({ Self.networkService })
        container.register({ Self.alertFactory })
        container.register({ Self.imageCachService })
    }
}

protocol NetworkServiceProtocol: AnyObject, PokemonListNetworkServiceProtocol & DetailsNetworkServiceProtocol { }

protocol CoreDataManagerProtocol: AnyObject, GetPokemonCoreDataManagerProtocol & SavePokemonCoreDataManagerProtocol { }

protocol AlertFactoryProtocol: AnyObject, AlertControllerFactoryProtocol { }

private extension ServiceConfiguration {
    
    static var coreDataManager: CoreDataManagerProtocol {
        return PokemonCoreDataManager()
    }
    
    static var internetConnetionMonitor: InternetConnectionMonitorServiceProtocol {
        return InternetConnectionMonitorService()
    }
    
    static var networkService: NetworkServiceProtocol {
        return NetworkService(networkSession: URLSession.shared,
                              internetConnectionMonitor: internetConnetionMonitor,
                              coreDataManager: coreDataManager)
    }
    
    static var alertFactory: AlertFactoryProtocol {
        return AlertControllerFactory()
    }
    
    static var imageCachService: ImageCacheService {
        return ImageCacheService.shared
    }
    
}
