//
//  RecipeDetailViewModel.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2020-01-07.
//  Copyright © 2020 Hadley Igoe. All rights reserved.
//

import UIKit

protocol RecipeDetailsViewModelProtocol {
    var meal: Meal? { get set }
}

class RecipeDetailsViewModel: RecipeDetailsViewModelProtocol {
    
    var meal: Meal?
}
