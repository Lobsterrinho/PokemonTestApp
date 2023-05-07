//
//  PokemonImageTableCellVM.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import UIKit

final class PokemonImageTableCellVM: PokemonImageTableCellVMProtocol {
    
    private var imageDownloadService: ImageDownloadServiceProtocol
    
    init(imageDownloadService: ImageDownloadServiceProtocol) {
        self.imageDownloadService = imageDownloadService
    }
    
    func prepareForReuse() {
        imageDownloadService.cancelCurrentDownload()
    }
    
    func loadImage(by url: String, handler: @escaping (UIImage?) -> Void) {
        imageDownloadService.downloadImage(from: url) { result in
            switch result {
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    handler(UIImage(named: "noImage"))
                }
            case .success(let image):
                DispatchQueue.main.async {
                    handler(image)
                }
            }
        }
    }
    
    
    
    
}
