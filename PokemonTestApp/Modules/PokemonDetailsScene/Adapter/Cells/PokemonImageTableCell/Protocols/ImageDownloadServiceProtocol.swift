//
//  ImageDownloadServiceProtocol.swift
//  PokemonTestApp
//
//  Created by Lobster on 6.05.23.
//

import Foundation

protocol ImageDownloadServiceProtocol: AnyObject {
    
    func downloadImage(from urlStr: String,
                       completion: @escaping DownloadHandler)
    func cancelCurrentDownload()
}
