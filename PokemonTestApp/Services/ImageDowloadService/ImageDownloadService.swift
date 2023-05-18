//
//  ImageDownloadService.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import Foundation
import UIKit

typealias DownloadHandler = (Result<UIImage?, Error>) -> Void

final class ImageDownloadService: ImageDownloadServiceProtocol {
    
    private var cache: ImageCacheService
    
    private var currentTask: URLSessionDownloadTask?
    private var currentRequest: URLRequest?
    
    init(cache: ImageCacheService) {
        self.cache = cache
    }
    
    func downloadImage(from urlStr: String,
                       completion: @escaping DownloadHandler) {
        if let cachedImage = cache.get(for: urlStr) {
            completion(.success(cachedImage))
            return
        }
        
        guard let url = URL(string: urlStr) else { return }
        
        var request = URLRequest(url: url)
        request.timeoutInterval = 5
        request.httpMethod = "GET"
        
        currentRequest = request
        
        currentTask = URLSession.shared.downloadTask(
            with: request
        ) { [weak self] fileURL, response, error in
            guard response?.url == self?.currentRequest?.url else { return }
            if let error = error {
                completion(.failure(error))
            }
            if let url = fileURL,
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                self?.cache.set(value: image, for: urlStr)
                completion(.success(image))
            }
        }
        currentTask?.resume()
    }
    
    func cancelCurrentDownload() {
        currentTask?.cancel()
        currentRequest = nil
    }
}
