//
//  ViewController.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-11-21.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit

class RecipeListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var recipeService = RecipeService()
    var recipes: [Meal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
    }
    
    private func loadData() {
        recipeService.fetchData { data, error in
            !error ? self.recipes = data: print("There was an error...")
            !error ? self.setupTableView(): print("There was an error...")
        }
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let headerNib = UINib.init(nibName: "RecipeAppHeaderView", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "RecipeAppHeaderView")
        tableView.reloadData()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let reicpeIndex = tableView.indexPathForSelectedRow,
                let destination = segue.destination as? RecipeDetailViewController else { return }
            destination.recipeInstructions = recipes[reicpeIndex.row].strInstructions
            destination.recipeName = recipes[reicpeIndex.row].strMeal
            destination.recipeImage = recipes[reicpeIndex.row].strMealThumb
        }
    }
}
    

extension RecipeListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "RecipeAppHeaderView") as? RecipeAppHeaderView else {return UIView()}
        //print(headerView.returnSearchText())
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as? RecipeAppCell else {return UITableViewCell()}
        let list = recipes[indexPath.row]
        cell.configureCell(recipeData: list)
        return cell
    }
}
