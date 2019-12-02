//
//  AppGlobal.swift
//  MapApplication
//
//  Created by Vinay Kumar on 02/12/19.
//  Copyright © 2019 Ankur Bansal. All rights reserved.
//

import UIKit


func printDebug <T>(_ obj: T) {
    print(obj)
}


//MARK: Colors Used in App
enum AppColors {
    
    static let white = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let headerColor = #colorLiteral(red: 0.05490196078, green: 0.137254902, blue: 0.4470588235, alpha: 1)
    static let shadowColor = #colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.3921568627, alpha: 1)
    
}


extension UITableViewCell {
    static var reusableIdentifier: String {
        return "\(self)"
    }
}


//MARK:  image download with cache.
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        if let cachedImage = AppDelegate.imageCache.object(forKey: url.absoluteString as NSString) {
            DispatchQueue.main.async() {
                self.image = cachedImage
            }
            return
        }
        
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            
            AppDelegate.imageCache.setObject(image, forKey: url.absoluteString as NSString)
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

