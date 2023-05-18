//
//  PokemonImageTableCellVMAssembler.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import Foundation

final class PokemonImageTableCellVMAssembler {
    
    private init() { }
    
    static func makeVM() -> PokemonImageTableCellVMProtocol {
        return PokemonImageTableCellVM(imageDownloadService: makeDownloadService())
    }
    
    private static func makeDownloadService() -> ImageDownloadServiceProtocol {
        return ImageDownloadServiceAssembler.makeImageDownloadService()
    }
}
