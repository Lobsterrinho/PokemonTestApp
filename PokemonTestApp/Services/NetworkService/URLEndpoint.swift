//
//  URLEndpoint.swift
//  PokemonTestApp
//
//  Created by Lobster on 21.06.23.
//

import Foundation

struct URLEndpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension URLEndpoint {
    
    //return URL with components
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "pokeapi.co"
        components.path = "/api/v2/" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }
    
    //Configure the path and query items
    static func pokemonsList(itemsPerPage: Int = 20, offset: Int = 0) -> Self {
        URLEndpoint(path: "pokemon/",
                    queryItems: [
                        URLQueryItem(name: "?limit=",
                                     value: "\(itemsPerPage)"),
                        URLQueryItem(name: "&offset=",
                                     value: "\(offset)")
                    ])
    }
    
    static func pokemonDetails(pokemonName: String) -> Self {
        URLEndpoint(path: "pokemon/\(pokemonName)")
    }
}
