//
//  Recipe.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-11-21.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import Foundation

struct Recipe: Codable {
    var meals: [Meal]
}

struct Meal: Codable {
    var strMeal: String
    var strInstructions: String
    var strMealThumb: String
    var strIngredient1: String
    var strIngredient2: String?
    var strIngredient3: String?
}
