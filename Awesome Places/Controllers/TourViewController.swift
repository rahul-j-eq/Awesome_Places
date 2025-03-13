//
//  TourViewController.swift
//  Awesome Places
//
//  Created by Gaurav Patel on 12/03/25.
//

import UIKit

class TourViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    var selectedCategory: Category? // Store the selected category
    var destinations: [Destination] = [] // Store destinations for selected category

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        setupKeyboardHandling()
    }
    deinit {
        removeKeyboardHandling()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Let's book a TOUR!"
        setupNavBar()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupNavBar(){
        let navBar = self.navigationController?.navigationBar
        let color = UIColor.systemPurple
        navBar?.tintColor = color
        navBar?.largeTitleTextAttributes = [.foregroundColor: color]
        navBar?.titleTextAttributes = [.foregroundColor: color]
    }
}

extension TourViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TourVehicleCell", for: indexPath) as! TourVehicleCell
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TourRatingCell", for: indexPath) as! TourRatingCell
            cell.delegate = self
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TourDetailsCell", for: indexPath) as! TourDetailsCell
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath)
            return cell
            
        default:return UITableViewCell()
        }
    }
}

extension TourViewController: TourRatingTVCDelegate {
    func didShowErrorAlert(title: String, message: String) {
        AlertManager.shared.showAlert(on: self, title: title, message: message)
    }
    
    func didSubmitRating(rating: Int) {
        print("Selected Rating := \(rating)")
        if rating == 5{
            AlertManager.shared.showAlert(on: self, title: "Submission Successful", message: "Thank you for 5 Star Rating!")
        }
    }
}
