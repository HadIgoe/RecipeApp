//
//  RecipeAppCell.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-11-21.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    
    let starButton = UIButton(type: .system)
    
    var starButtonAction : (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configureCell(meal: Meal?) {
        guard let meal = meal else { return mealName.text = "ERRORRR" }
        mealName.text = meal.mealName
        mealImage.loadUsingUrlString(urlString: meal.mealImage)
        layer.borderWidth = 3
        layer.cornerRadius = 15
        layer.borderColor = UIColor.white.cgColor
        clipsToBounds = false
        
        setUpStar()
    }
    
    private func setUpStar() {
        starButton.setImage(#imageLiteral(resourceName: "fav_Star"), for:.normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        starButton.tintColor = .gray
        starButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        accessoryView = starButton
    }
    
    @objc private func handleMarkAsFavorite() {
        if starButton.tintColor == .gray {
            starButton.tintColor = .yellow
        } else {
            starButton.tintColor = .gray
        }
         starButtonAction?()
    }
}


