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
    var mealName: String
    var instructions: String
    var mealImage: String
    var ingredient: String
    
    private enum CodingKeys: String, CodingKey {
        case mealName = "strMeal"
        case instructions = "strInstructions"
        case mealImage = "strMealThumb"
        case ingredient = "strIngredient1"
    }
}
