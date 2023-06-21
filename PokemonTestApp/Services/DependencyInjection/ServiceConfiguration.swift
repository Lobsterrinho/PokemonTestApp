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
        container.register({ Self.coreDataService })
        container.register({ makeCoreDataManager(container.resolve()) })
        container.register({ Self.internetConnetionMonitor })
        container.register({ Self.makeNetworkService(container.resolve()) })
        container.register({ Self.alertFactory })
        container.register({ Self.imageCachService })
    }
}

protocol NetworkServiceProtocol: AnyObject, PokemonListNetworkServiceProtocol & DetailsNetworkServiceProtocol { }

protocol CoreDataManagerProtocol: AnyObject, GetPokemonCoreDataManagerProtocol & SavePokemonCoreDataManagerProtocol { }

protocol AlertFactoryProtocol: AnyObject, AlertControllerFactoryProtocol { }

private extension ServiceConfiguration {
    
    static func makeCoreDataManager(
        _ service: PokemonsCoreDataService
    ) -> CoreDataManagerProtocol {
        return PokemonCoreDataManager(coreData: service)
    }
    
    static var internetConnetionMonitor: InternetConnectionMonitorServiceProtocol {
        return InternetConnectionMonitorService()
    }
    
    static func makeNetworkService(
        _ coreData: CoreDataManagerProtocol
    ) -> NetworkServiceProtocol {
        return NetworkService(networkSession: URLSession.shared,
                              internetConnectionMonitor: internetConnetionMonitor,
                              coreDataManager: coreData)
    }
    
    static var alertFactory: AlertFactoryProtocol {
        return AlertControllerFactory()
    }
    
    static var imageCachService: ImageCacheService {
        return ImageCacheService.shared
    }
    
    static var coreDataService = PokemonsCoreDataService()
    
}
