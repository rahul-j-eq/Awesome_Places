//
//  DestinationListViewController.swift
//  Awesome Places
//
//  Created by Gaurav Patel on 12/03/25.
//

import UIKit

class DestinationListViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    var selectedCategory: Category? // Store the selected category
    var destinations: [Destination] = [] // Store destinations for selected category

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
        setupKeyboardHandling()
    }
    deinit {
        removeKeyboardHandling()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "RateTableViewCell", bundle: nil), forCellReuseIdentifier: "RateTableViewCell")
    }
    
    private func setupNavBar(){
        if let selectedCategory = selectedCategory {
            self.destinations = selectedCategory.destinations
            self.title = selectedCategory.title
            
            let titleColor = selectedCategory.color
            
            let navBar = self.navigationController?.navigationBar
            navBar?.tintColor = titleColor
            navBar?.largeTitleTextAttributes = [.foregroundColor: titleColor]
            navBar?.titleTextAttributes = [.foregroundColor: titleColor]
        }
    }
}

extension DestinationListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let extraRow = (selectedCategory?.title == "Cultural") ? 1 : 0
        return (destinations.count + extraRow + 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
            
        case destinations.count + 1: // Show RateTableViewCell at the end if Cultural
            if selectedCategory?.title == "Cultural" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "RateTableViewCell", for: indexPath) as! RateTableViewCell
                cell.delegate = self
                return cell
            }
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableCell", for: indexPath) as! DetailsTableCell
            
            let destination = destinations[indexPath.row - 1] // Adjust index for top cell
            let name = destination.name , color = selectedCategory?.color , description = destination.description , imageURL = destination.imageURL
            cell.configure(name: name, color: color, description: description, Image: imageURL)
            return cell
        }
        
        return UITableViewCell() // Default return (should not be reached)
    }
}
 
extension DestinationListViewController: DestinationRatingTVCDelegate {
    func didShowErrorAlert(title: String, message: String) {
        AlertManager.shared.showAlert(on: self, title: title, message: message)
    }
    
    func didSubmitFeedbackSuccessfully(rating: Int, feedback: String?) {
        let feedbackMessage = feedback?.isEmpty == false ? "Feedback: \(feedback!)" : "No feedback provided."
        let successMessage = "Thank you for your rating of \(rating) stars!\n\(feedbackMessage)"
        
        AlertManager.shared.showAlert(on: self, title: "Submission Successful", message: successMessage)
    }
}
