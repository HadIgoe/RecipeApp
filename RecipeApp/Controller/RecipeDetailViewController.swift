//
//  RecipeDetailsViewController.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-11-21.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit
import LazyImage

class RecipeDetailViewController: UIViewController, StoryBoarded {
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var largeRecipeImage: UIImageView!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    lazy var lazyImage: LazyImage = LazyImage()
    var meal: Meal?
    weak var coordinator: ApplicationCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        guard let meal = meal else { return }
        recipeTitle.text = meal.mealName
        lazyImage.show(imageView: largeRecipeImage, url: meal.mealImage)
        ingredientsLabel.text = meal.ingredient
        instructionsLabel.text = meal.instructions
    }
}
