//
//  RecipeAppCell.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-11-21.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit
import LazyImage

class RecipeAppCell: UITableViewCell {

    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    
    lazy var lazyImage: LazyImage = LazyImage()
    
    let newSize = CGSize(width: 50, height: 50)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configureCell(recipeData: Meal) {
        mealImage.image = UIImage(named: "placeholder")
        self.lazyImage.showWithSpinner(imageView: self.mealImage, url: recipeData.strMealThumb, size: newSize) { (error: LazyImageError?) in
            guard let error = error else {return}
            print(error)
        }
        mealName.text = recipeData.strMeal
    }
}
