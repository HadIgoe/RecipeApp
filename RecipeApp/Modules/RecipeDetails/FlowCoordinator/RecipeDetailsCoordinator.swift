//
//  RecipeDetailsCoordinator.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-12-10.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit

class RecipeDetailsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var currentMeal: Meal?

    init(navigationController: UINavigationController, currentMeal: Meal) {
        self.navigationController = navigationController
        self.currentMeal = currentMeal
    }

    func start() {
        let recipeDetailsViewModel = RecipeDetailsViewModel()
        let recipeDetailsViewController = RecipeDetailsViewController.create(viewModel: recipeDetailsViewModel)
        recipeDetailsViewModel.meal = currentMeal
        recipeDetailsViewController.coordinator = self
        navigationController.pushViewController(recipeDetailsViewController, animated: true)
    }
}
