//
//  RecipeAppHeaderView.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-11-21.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit

class RecipeHeaderView: UITableViewHeaderFooterView {
   
    @IBOutlet weak var recipeSearchBar: UISearchBar!
    
    let recipeSearchPlaceHolder = "Search recipes"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        recipeSearchBar.placeholder = recipeSearchPlaceHolder
    }
}
