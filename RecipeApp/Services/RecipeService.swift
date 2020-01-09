//
//  RecipeService.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-11-21.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import Foundation
import Alamofire

protocol RecipeServiceProtocol {
    func fetchData(completion: @escaping ([Meal], Bool) -> Void)
}

class RecipeService: RecipeServiceProtocol {
    private let URL = "https://www.themealdb.com/api/json/v1/1/search.php?f=c"
    
    func fetchData(completion: @escaping ([Meal], Bool) -> Void) {
        Alamofire.request(URL, method: .get).responseJSON { response in
            if response.result.isSuccess {
                guard let data = response.data else { return }
                if let json = try? JSONDecoder().decode(Recipe.self, from: data) {
                    completion(json.meals, false)
                } else {
                    completion([], true)
                }
            } else {
                completion([], true)
            }
        }
    }
}
