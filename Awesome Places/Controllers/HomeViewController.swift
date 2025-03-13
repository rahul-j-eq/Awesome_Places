//
//  ViewController.swift
//  Awesome Places
//
//  Created by Gaurav Patel on 11/03/25.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let categories = travelCategories
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: "MainHeaderCell") as! MainHeaderCell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainCategoryCell") as! MainCategoryCell
            cell.delegate = self
            cell.configure(with: categories)
            tableView.performBatchUpdates(nil)
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainFooterCell") as! MainFooterCell
            cell.delegate = self
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension HomeViewController: MainCategoryCellDelegate {
    func didSelectTourBtn() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "goesToTour", sender: nil)
        }
    }
    
    func didSelectCategory(_ category: Category) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "goesToDestination", sender: category)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goesToDestination",
           let destinationVC = segue.destination as? DestinationListViewController,
           let selectedCategory = sender as? Category {
            destinationVC.selectedCategory = selectedCategory
        }
    }
}

