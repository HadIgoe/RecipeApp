//
//  RecipeListViewModel.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-12-13.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import Foundation

protocol RecipeListViewModelProtocol {
    func viewWillAppear()
    func addFavoriteMeal(favoriteMeal: Meal?)
    func recipeDataFor(row: Int) -> Meal?
    func recipeCount() -> Int
    var updateHandler: (() -> Void)? { get set }
    var mealSelected: ((Meal) -> Void)? { get set }
    var isErrorMessage: Bool { get }
}

class RecipeListViewModel: RecipeListViewModelProtocol {
    
    var recipeService: RecipeServiceProtocol?
    var favoriteService: FavoriteServiceProtocol?
    var recipes: [Meal]?
    var updateHandler: (() -> Void)?
    var mealSelected: ((Meal) -> Void)?
    
    init(recipeService: RecipeServiceProtocol, favoriteService: FavoriteServiceProtocol) {
        self.recipeService = recipeService
        self.favoriteService = favoriteService
    }
    
    var isErrorMessage: Bool {
        guard let recipes = recipes else { return true }
        if recipes.count > 1 {
            return false
        }
        return true
    }
    
    private(set) var hasLoaded: Bool = false {
        didSet {
            updateHandler?()
        }
    }

    private func loadData() {
        hasLoaded = true
        recipeService?.fetchData() { data, error in
            if !error {
                self.recipes = data
                self.hasLoaded = false
            }
        }
    }
    
    func viewWillAppear() {
        loadData()
    }
    
    func recipeCount() -> Int {
        return recipes?.count ?? 0
    }
    
    func recipeDataFor(row: Int) -> Meal? {
        return recipes?[row]
    }
    
    func addFavoriteMeal(favoriteMeal: Meal?) {
        guard let meal = favoriteMeal else { return }
        favoriteService?.addToFavoriteList(meal: meal)
    }
}
