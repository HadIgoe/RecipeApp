//
//  ViewController.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-11-21.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit

final class RecipeListViewController: UIViewController, ViewControllerCreatableWithViewModel {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: UIView!
    
    var viewModel: RecipeListViewModelProtocol!
    
    static func createViewController() -> RecipeListViewController {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "RecipeList", bundle: Bundle.main )
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.updateHandler = { [weak self] in self?.updateUI() }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUI()
        tabBarController?.tabBar.isHidden = false
        viewModel.viewWillAppear()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let headerNib = UINib.init(nibName: "RecipeHeaderView", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "RecipeHeaderView")
        tableView.reloadData()
        tableView.rowHeight = 100
    }
    
    private func updateUI() {
        errorView.isHidden = !viewModel.isErrorMessage
        tableView.isHidden = viewModel.isErrorMessage
        tableView.reloadData()
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
        viewModel.recipeCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
            as? RecipeCell else { return UITableViewCell() }
        let meal = viewModel.recipeDataFor(row: indexPath.row)
        cell.configureCell(meal: meal)
        cell.starButtonAction = {
            self.viewModel.addFavoriteMeal(favoriteMeal: meal)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let meal = viewModel.recipeDataFor(row: indexPath.row) else { return }
        viewModel.mealSelected?(meal)
    }
}
