//
//  Extension.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2020-01-27.
//  Copyright © 2020 Hadley Igoe. All rights reserved.
//

import UIKit


extension UIImageView {
    func loadUsingUrlString(urlString: String) {
        let imageUrlString = urlString
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        if imageUrlString == urlString {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}
