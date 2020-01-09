//
//  RecipeDetailsViewController.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-11-21.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit
import LazyImage

final class RecipeDetailsViewController: UIViewController, ViewControllerCreatableWithViewModel {
    
    @IBOutlet weak var largeRecipeImage: UIImageView!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    var viewModel: RecipeDetailsViewModelProtocol!
    
    static func createViewController() -> RecipeDetailsViewController {
       let id = String(describing: self)
       let storyboard = UIStoryboard(name: "RecipeDetails", bundle: Bundle.main )
       return storyboard.instantiateViewController(withIdentifier: id) as! Self
   }
   
   override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    lazy var lazyImage: LazyImage = LazyImage()
    weak var coordinator: RecipeDetailsCoordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        tabBarController?.tabBar.isHidden = true
        guard let meal = viewModel.meal else { return }
        recipeTitle.text = meal.mealName
        lazyImage.show(imageView: largeRecipeImage, url: meal.mealImage)
        ingredientsLabel.text = meal.ingredient
        instructionsLabel.text = meal.instructions
    }
}
