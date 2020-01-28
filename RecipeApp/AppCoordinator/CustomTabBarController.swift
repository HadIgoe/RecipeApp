//
//  CustomTabBarController.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-12-19.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    var appCoordinator: ApplicationCoordinator?
    var recipeBookCoordinator: RecipeBookCoordinator?
    var favoriteSevice = FavoriteService()
    var recipeService = RecipeService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navController = UINavigationController()
        appCoordinator = ApplicationCoordinator(navigationController: navController, favoriteService: favoriteSevice, recipeService: recipeService)
        appCoordinator?.start()
        
        let recipeBookNavController = UINavigationController()
        recipeBookCoordinator = RecipeBookCoordinator(navigationController: recipeBookNavController, favoriteService: favoriteSevice)
         recipeBookCoordinator?.start()
       
        viewControllers = [(appCoordinator?.navigationController ?? UIViewController()), (recipeBookCoordinator?.navigationController ?? UIViewController())]
    }
}
