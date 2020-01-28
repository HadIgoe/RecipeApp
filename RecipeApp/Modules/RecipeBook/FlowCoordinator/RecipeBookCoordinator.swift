//
//  RecipeBookCoordinator.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-12-17.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit

class RecipeBookCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var favoriteService: FavoriteServiceProtocol

    init(navigationController: UINavigationController, favoriteService: FavoriteServiceProtocol) {
       self.navigationController = navigationController
       self.favoriteService = favoriteService
   }

    func start() {
        let recipeBookViewModel = RecipeBookViewModel(favoriteService: favoriteService)
        let recipeBookViewController = RecipeBookViewController.create(viewModel: recipeBookViewModel)
        recipeBookViewController.coordinator = self
        navigationController.pushViewController(recipeBookViewController, animated: true)
        recipeBookViewController.tabBarItem.title = "Favorites"
        recipeBookViewController.tabBarItem.image = UIImage(named: "Favorite")
        
        recipeBookViewModel.favoriteMealSelected = { [weak self] meal in
            self?.viewRecipeDetails(meal: meal)
        }
    }
    
    func viewRecipeDetails(meal: Meal) {
        let recipeDetailsCoordinator = RecipeDetailsCoordinator(navigationController: navigationController, currentMeal: meal)
        recipeDetailsCoordinator.start()
    }
}

