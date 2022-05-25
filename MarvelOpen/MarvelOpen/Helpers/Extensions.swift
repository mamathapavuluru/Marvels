//
//  Extensions.swift
//  MarvelOpen
//
//  Created by Mamatha on 12/05/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func startLoadingActivityIndicator() {
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .large)
        activityIndicator.tag = 9999
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.view.center
    }
    
    func stopLoadingActivityIndicator() {
        if let activityIndicator = self.view.subviews.filter({$0.tag == 9999}).first as? UIActivityIndicatorView {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
    
    func presentAlertController(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: NSLocalizedString(kOKText, comment: ""), style: .default)
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension UIView {
    func setCornerRadiusForView(corners : CGFloat){
        self.layer.cornerRadius = corners
        self.layer.masksToBounds = true
    }
}


let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImageFromCache(withUrl urlString : String) {
        guard let url = URL(string: urlString) else {return}
        self.image = nil
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .medium)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.center
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                return
            }
            DispatchQueue.main.async {
                guard let imageData = data else {return}
                if let image = UIImage(data: imageData) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                    activityIndicator.removeFromSuperview()
                }
            }
        }).resume()
    }
}


