//
//  ViewController.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-11-21.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit

class RecipeListViewController: UIViewController, StoryBoarded {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: UIView!
    
    var recipeService = RecipeService()
    var recipes: [Meal]?
    weak var coordinator: ApplicationCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorView.isHidden = true
        loadData()
    }

    private func loadData() {
        recipeService.fetchData { data, error in
            !error ? self.recipes = data: self.showErrorMessage()
            !error ? self.setupTableView(): self.showErrorMessage()
        }
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let headerNib = UINib.init(nibName: "RecipeHeaderView", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "RecipeHeaderView")
        tableView.reloadData()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    private func showErrorMessage() {
        errorView.isHidden = false
        tableView.isHidden = true
    }
}

extension RecipeListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "RecipeHeaderView")
            as? RecipeHeaderView else { return UIView() }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
            as? RecipeCell else { return UITableViewCell() }
        let meal = recipes?[indexPath.row]
        cell.configureCell(meal: meal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let meal = recipes?[indexPath.row] else { return }
        coordinator?.viewRecipeDetails(meal: meal)
    }
}
