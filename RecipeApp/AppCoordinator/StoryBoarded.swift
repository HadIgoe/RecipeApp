//
//  StoryBoarded.swift
//  CoordinatorTest
//
//  Created by Hadley Igoe on 2019-12-04.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//
import UIKit

protocol StoryBoarded {
    static func instantiate() -> Self
}

extension StoryBoarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "RecipeList", bundle: Bundle.main )
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
