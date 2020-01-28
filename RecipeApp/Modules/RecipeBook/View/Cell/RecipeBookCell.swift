//
//  RecipeBookCell.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-12-17.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit

class RecipeBookCell: UITableViewCell {
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configureCell(meal: Meal?) {
        guard let meal = meal else { return favoriteLabel.text = "ERROR" }
        favoriteLabel.text = meal.mealName
        favoriteImage.loadUsingUrlString(urlString: meal.mealImage)
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 15
        clipsToBounds = false
    }
}
