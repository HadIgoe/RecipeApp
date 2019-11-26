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
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var largeRecipeImage: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var recipeTitle: UILabel!
    
    var recipeInstructions = ""
    var recipeIngredients = ""
    var recipeImage = ""
    var recipeName = ""
    
    lazy var lazyImage: LazyImage = LazyImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        instructionsLabel.text = recipeInstructions
        recipeTitle.text = recipeName
        lazyImage.show(imageView: largeRecipeImage, url: recipeImage)
    }
   
}
