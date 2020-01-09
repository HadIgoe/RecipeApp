//
//  RecipeBookViewController.swift
//  RecipeApp
//
//  Created by Hadley Igoe on 2019-12-17.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit

final class RecipeBookViewController: UIViewController, ViewControllerCreatableWithViewModel {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    
    var viewModel: RecipeBookViewModelProtocol!
    weak var coordinator: RecipeBookCoordinator?
       
   static func createViewController() -> RecipeBookViewController {
       let id = String(describing: self)
       let storyboard = UIStoryboard(name: "RecipeBook", bundle: Bundle.main )
       return storyboard.instantiateViewController(withIdentifier: id) as! Self
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = false
        setupTableView()
        viewModel.updateHandler = { [weak self] in self?.updateUI() }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewWillAppear()
        updateUI()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let headerNib = UINib.init(nibName: "RecipeHeaderView", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "RecipeHeaderView")
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
    }
    
    private func updateUI() {
        emptyView.isHidden = !viewModel.isEmptyMessage
        tableView.isHidden = viewModel.isEmptyMessage
        tableView.reloadData()
    }

}

extension RecipeBookViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "RecipeHeaderView")
           as? RecipeHeaderView else { return UIView() }
        return headerView
    }
       
   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
   }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.favoriteRecipeCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeBookCell", for: indexPath)
            as? RecipeBookCell else { return UITableViewCell() }
        let favoriteMeal = viewModel.recipeDataFor(row: indexPath.row)
        cell.configureCell(meal: favoriteMeal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let meal = viewModel.recipeDataFor(row: indexPath.row) else { return }
        viewModel.favoriteMealSelected?(meal)
    }
}
