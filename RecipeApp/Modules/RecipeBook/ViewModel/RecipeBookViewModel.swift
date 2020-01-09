//
//  RecipeBookViewModel.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-12-17.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import Foundation

protocol RecipeBookViewModelProtocol {
    func viewWillAppear()
    func fetchFavorites()
    func favoriteRecipeCount() -> Int
    func recipeDataFor(row: Int) -> Meal?
    var favoriteMealSelected: ((Meal) -> Void)? { get set }
    var updateHandler: (() -> Void)? { get set }
    var isEmptyMessage: Bool { get }
    var favoriteRecipes: [Meal]? { get set }
}

class RecipeBookViewModel: RecipeBookViewModelProtocol {
    var favoriteService: FavoriteServiceProtocol?
    var favoriteRecipes: [Meal]?
    var updateHandler: (() -> Void)?
    var favoriteMealSelected: ((Meal) -> Void)?
    
    init(favoriteService: FavoriteServiceProtocol) {
        self.favoriteService = favoriteService
    }
    
   private(set) var hasLoaded: Bool = false {
        didSet {
           updateHandler?()
       }
    }
    
    var isEmptyMessage: Bool {
        guard let favoriteRecipes = favoriteRecipes else { return true }
        if favoriteRecipes.count > 0 {
            return false
        }
        return true
    }
    
    func viewWillAppear() {
        fetchFavorites()
    }
    
    func fetchFavorites() {
        favoriteRecipes = favoriteService?.retrieveFavoriteMeals()
    }
    
    func favoriteRecipeCount() -> Int {
        favoriteRecipes?.count ?? 0
    }
    
    func recipeDataFor(row: Int) -> Meal? {
        return favoriteRecipes?[row]
    }
}
