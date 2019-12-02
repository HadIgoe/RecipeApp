//
//  RecipeListCoordinator.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-12-09.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import Foundation
import UIKit

class RecipeListCoordinator: Coordinator {
    
    private var presenter: UINavigationController
    private var recipeDetailCoordinator: RecipeDetailCoordinator?
    private var recipeListViewController: RecipeListViewController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let recipeListViewController = RecipeListViewController()
        recipeListViewController.delegate = self
   
        self.recipeListViewController = recipeListViewController
        presenter.pushViewController(recipeListViewController, animated: true)
    }
}

extension RecipeListCoordinator: RecipeListViewControllerDelegate {
    
    func recipeListViewController(_ controller: RecipeListViewController, didSelect meal: Meal) {
        let recipeDetailCoordinator = RecipeDetailCoordinator(presenter: presenter, meal: meal)
        
        self.recipeDetailCoordinator = recipeDetailCoordinator
        recipeDetailCoordinator.start()
    }
}
