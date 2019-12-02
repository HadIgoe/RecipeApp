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

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = RecipeDetailViewController.instantiate()
        vc.meal = currentMeal
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
