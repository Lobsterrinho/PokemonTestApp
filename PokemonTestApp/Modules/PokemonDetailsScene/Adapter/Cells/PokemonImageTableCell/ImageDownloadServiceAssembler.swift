//
//  ImageDownloadServiceAssembler.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import Foundation

final class ImageDownloadServiceAssembler {
    
    private init() { }
    
    static func makeImageDownloadService() -> ImageDownloadServiceProtocol {
        return ImageDownloadService(cache: .shared)
    }
}
