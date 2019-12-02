//
//  RecipeDetailsViewController.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-11-21.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit
import LazyImage

class RecipeDetailViewController: UIViewController {
    @IBOutlet weak var largeRecipeImage: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var recipeTitle: UILabel!
    
    var recipeInstructions = ""
    var recipeIngredients = ""
    var recipeIngredients2 = ""
    var recipeIngredients3 = ""
    var recipeImage = ""
    var recipeName = ""
    lazy var lazyImage: LazyImage = LazyImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeDetailsSetup()
    }
    
    private func recipeDetailsSetup() {
        let formattedIngredients = "\u{2022} \(recipeIngredients) \n \u{2022} \(recipeIngredients2) \n \u{2022} \(recipeIngredients3)"
        instructionsLabel.text = recipeInstructions
        recipeTitle.text = recipeName
        lazyImage.show(imageView: largeRecipeImage, url: recipeImage)
        ingredientsLabel.text = formattedIngredients
    }
}
