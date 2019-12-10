//
//  ApplicationCoordinator.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-12-09.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import Foundation
import UIKit

class ApplicationCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RecipeListViewController.instantiate()
        viewController.completion = { [weak self] selectedMeal in
            print("--- selected meal: \(selectedMeal.mealName)")
            self?.startRecipeDetails(meal: selectedMeal)
        }
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func startRecipeDetails(meal: Meal) {
        let vc = RecipeDetailViewController.instantiate()
        vc.meal = meal
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
