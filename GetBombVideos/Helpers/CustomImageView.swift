//
//  CustomImageView.swift
//  GetBombVideos
//
//  Created by Clinton Johnson on 11/7/18.
//  Copyright © 2018 Clinton Johnson. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func downloaderFrom(url: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        contentMode = mode
        
        guard let urlString = URL(string: url) else {return}
        
        imageUrlString = url
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: urlString) { (data, res, err) in
            guard
                let httpUrlRes = res as? HTTPURLResponse, httpUrlRes.statusCode == 200,
                let mimeType = res?.mimeType, mimeType.hasPrefix("image"),
                let data = data, err == nil,
                let image = UIImage(data: data)
                else {return}
            DispatchQueue.main.async {
                let imageToCache = image
                
                if self.imageUrlString == url {
                    self.image = imageToCache
                }
                
                imageCache.setObject(imageToCache, forKey: url as AnyObject)
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        //        guard let url = URL(string: link) else {return}
        downloaderFrom(url: link, contentMode: mode)
    }
}
