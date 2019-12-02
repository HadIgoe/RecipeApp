//
//  RecipeAppCell.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-11-21.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit
import LazyImage

class RecipeCell: UITableViewCell {
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    
    lazy var lazyImage: LazyImage = LazyImage()
    let newSize = CGSize(width: 50, height: 50)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configureCell(meal: Meal?) {
        guard let meal = meal else { return mealName.text = "ERRORRR" }
        mealName.text = meal.mealName
        self.mealImage.image = UIImage(named: "placeholder")
        self.lazyImage.showWithSpinner(imageView: self.mealImage, url: meal.mealImage, size: newSize) { (error: LazyImageError?) in
        guard let error = error else { return }
            print(error)
        }
        layer.borderWidth = 1
        layer.cornerRadius = 8
        clipsToBounds = true
    }
}
