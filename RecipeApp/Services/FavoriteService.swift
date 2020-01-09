//
//  FavoriteService.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-12-20.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import Foundation

protocol FavoriteServiceProtocol {
    func addToFavoriteList(meal: Meal)
    func retrieveFavoriteMeals() -> [Meal]
}

class FavoriteService: FavoriteServiceProtocol {
    
    var favoriteRecipes: [Meal] = []
    
    func addToFavoriteList(meal: Meal) {
        if !favoriteRecipes.contains(where: { $0.mealName == meal.mealName }) {
            favoriteRecipes.append(meal)
        }
    }
    
    func retrieveFavoriteMeals() -> [Meal] {
        return favoriteRecipes
    }
}

