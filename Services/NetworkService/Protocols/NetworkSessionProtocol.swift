//
//  NetworkSessionProtocol.swift
//  PokemonTestApp
//
//  Created by Lobster on 7.05.23.
//

import Foundation

protocol NetworkSessionProtocol {
    
    func callDataTask(with request: URLRequest,
                      completionHandler: @escaping (Data?,
                                                    URLResponse?,
                                                    Error?) -> Void)
}

extension URLSession: NetworkSessionProtocol {
    
    func callDataTask(with request: URLRequest,
                      completionHandler: @escaping (Data?,
                                                    URLResponse?,
                                                    Error?) -> Void) {
        Self.shared.dataTask(with: request,
                             completionHandler: completionHandler).resume()
    }
}
