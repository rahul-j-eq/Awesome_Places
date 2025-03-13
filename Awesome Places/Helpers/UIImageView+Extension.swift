//
//  UIImageView+Extension.swift
//  Awesome Places
//
//  Created by Gaurav Patel on 12/03/25.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>() // Global cache for images

extension UIImageView {
    
    func loadImage(from urlString: String, placeholder: UIImage? = nil, contentMode: UIView.ContentMode = .scaleAspectFill) {
        
        self.image = placeholder
        self.contentMode = contentMode
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)")
            return
        }
        
        // Check if the image is already cached
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let data = try? Data(contentsOf: url), let downloadedImage = UIImage(data: data) {
                
                imageCache.setObject(downloadedImage, forKey: urlString as NSString) // Cache the image
                
                DispatchQueue.main.async {
                    self?.image = downloadedImage
                }
            } else {
                print("Failed to load image from URL: \(urlString)")
            }
        }
    }
}
