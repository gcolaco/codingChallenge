//
//  CustomImageView.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import UIKit

/*
 This file is responsible to get the images from the API. The loadImage function, gets the image, put it on the main thread asynchronously, with that we can avoid the Racing problem, this problem happens when one image from a tableView Row is load in another tableView Row when it gets dequeued, when we solve this problem its only going to show the correct image, due to that we use a spinner to show the user that the image is being loaded. This func also cache the image, so everytime we scroll the tableView it doesn't need to reload all the images again, saving us resources.
 
 */

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    var task: URLSessionTask!
    let spinner = UIActivityIndicatorView(style: .gray)
    
    //Read comment above
    func loadImage(from url: URL) {
        image = nil
        
        addSpinner()
        
        
        if let task = task {
            task.cancel()
        }
        
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage{
            image = imageFromCache
            removeSpinner()
            return
        }
        
        task = URLSession.shared.dataTask(with: url) { (data,_,_) in
            
            guard let data = data, let newImage = UIImage(data: data) else { return}
            
            imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
            
            DispatchQueue.main.async {
                self.image = newImage
                self.removeSpinner()
            }
            
        }
        task.resume()
    }
    
    func addSpinner() {
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        spinner.startAnimating()
    }
    
    func removeSpinner() {
        spinner.removeFromSuperview()
    }
    
    
}
