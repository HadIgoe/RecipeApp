//
//  RecipeBookCell.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-12-17.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit
import LazyImage

class RecipeBookCell: UITableViewCell {
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    
    lazy var lazyImage: LazyImage = LazyImage()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configureCell(meal: Meal?) {
        guard let meal = meal else { return favoriteLabel.text = "ERROR" }
        favoriteLabel.text = meal.mealName
        favoriteImage.image = UIImage(named: "placeholder")
        lazyImage.show(imageView: favoriteImage, url: meal.mealImage)
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 15
        clipsToBounds = false
    }
}
