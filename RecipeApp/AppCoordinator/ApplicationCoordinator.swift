//
//  ApplicationCoordinator.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-12-09.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    var navigationController: UINavigationController
    var favoriteService: FavoriteServiceProtocol
    var recipeService: RecipeServiceProtocol
    
    init(navigationController: UINavigationController, favoriteService: FavoriteServiceProtocol, recipeService: RecipeServiceProtocol) {
        self.navigationController = navigationController
        self.favoriteService = favoriteService
        self.recipeService = recipeService
    }
    
    func start() {
        let recipeListViewModel = RecipeListViewModel(recipeService: recipeService, favoriteService: favoriteService)
        let recipeListViewController = RecipeListViewController.create(viewModel: recipeListViewModel)
        recipeListViewController.tabBarItem.title = "Home"
        recipeListViewController.tabBarItem.image = UIImage(named: "Home")
        
        recipeListViewModel.mealSelected = { [weak self] meal in
            self?.viewRecipeDetails(meal: meal)
        }
        navigationController.pushViewController(recipeListViewController, animated: false)
    }
    
    func viewRecipeDetails(meal: Meal) {
        let recipeDetailsViewController = RecipeDetailsCoordinator(navigationController: navigationController, currentMeal: meal)
        recipeDetailsViewController.start()
    }
}
