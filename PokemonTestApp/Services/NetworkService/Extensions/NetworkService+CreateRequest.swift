//
//  NetworkService+CreateRequest.swift
//  PokemonTestApp
//
//  Created by Lobster on 12.05.23.
//

import Foundation

extension NetworkService {
    
    static func createRequest(with url: URL?, type: HTTPMethodEndpoint, completion: @escaping (URLRequest) -> Void) {
        guard let apiURL = url else { return }
        var request = URLRequest(url: apiURL)
        request.httpMethod = type.rawValue
        request.timeoutInterval = 20
        completion(request)
    }
    
}
