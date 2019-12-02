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
        let vc = RecipeListViewController.instantiate()
        vc.completion = { [weak self] meal in
            self?.viewRecipeDetails(meal: meal)
        }
        navigationController.pushViewController(vc, animated: false)
    }
    
    func viewRecipeDetails(meal: Meal) {
        let viewController = RecipeDetailsCoordinator(navigationController: navigationController)
        viewController.currentMeal = meal
        viewController.start()
    }
}
