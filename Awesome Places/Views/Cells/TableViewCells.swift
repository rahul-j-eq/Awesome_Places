//
//  Untitled.swift
//  Awesome Places
//
//  Created by Gaurav Patel on 11/03/25.
//

import UIKit


protocol MainCategoryCellDelegate: AnyObject {
    func didSelectCategory(_ category: Category)
    func didSelectTourBtn()
}

// Helper function for setting up the UICollectionView
extension UITableViewCell {
    func setupCollectionView(_ collectionView: UICollectionView, delegate: UICollectionViewDelegate & UICollectionViewDataSource , direction : UICollectionView.ScrollDirection) {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = direction
        }
        collectionView.delegate = delegate
        collectionView.dataSource = delegate
        print("Delegate and DataSource Set")
    }
}

//MARK: - Main Screen.
class MainHeaderCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


// MARK: Categoaries
class MainCategoryCell: UITableViewCell {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var categoryCollectionViewHeightConstraint: NSLayoutConstraint!
    
    private var categories: [Category] = []
    weak var delegate: MainCategoryCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    func configure(with categories: [Category]) {
        self.categories = categories
        categoryCollectionView.reloadData()
        updateCollectionViewHeight()
    }
    
    private func setupCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    private func updateCollectionViewHeight() {
        DispatchQueue.main.async {
            self.categoryCollectionViewHeightConstraint.constant = self.categoryCollectionView.collectionViewLayout.collectionViewContentSize.height
            self.layoutIfNeeded()
        }
    }
}


extension MainCategoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.configure(with: categories[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width / 2 - 10
        return CGSize(width: size, height: size-20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCategory = categories[indexPath.item]
        delegate?.didSelectCategory(selectedCategory)
    }
}

// MARK: Footer
class MainFooterCell: UITableViewCell {
    
    @IBOutlet weak var btnBookARide: UIButton!
    weak var delegate: MainCategoryCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func btnBookARidePressed(_ sender: UIButton) {
        print(#function)
        delegate?.didSelectTourBtn()
    }
}


//MARK: - DetailsVC Cells
class DetailsTableCell: UITableViewCell {
    
    @IBOutlet weak var destinationNameLbl: UILabel!
    @IBOutlet weak var destinationImage: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(name: String , color: UIColor? , description: String , Image: String) {
        self.destinationNameLbl.text = name
        self.destinationNameLbl.textColor = color
        self.descriptionLbl.text = description
        DispatchQueue.main.async {  
            self.destinationImage.loadImage(from: Image)
        }
    }
}


//MARK: - TourVC Cells
protocol TourRatingTVCDelegate: AnyObject {
    func didShowErrorAlert(title: String, message: String)
    func didSubmitRating(rating: Int)
}

class TourVehicleCell: UITableViewCell {
    
    @IBOutlet weak var car1: UIButton!
    @IBOutlet weak var bike2: UIButton!
    @IBOutlet weak var bus3: UIButton!
    
    private var selectedVehicleTag: Int = 0  // Track selected button
    
    override func awakeFromNib() {
        super.awakeFromNib()
        disableAllButtons()
    }
    
    private func disableAllButtons() {
        let buttons = [car1, bike2, bus3]
        buttons.forEach { $0?.layer.borderWidth = 0 } // Hide borders initially
    }
    
    @IBAction func vehicleButtonTapped(_ sender: UIButton) {
        selectedVehicleTag = sender.tag  // Update selected vehicle
        updateButtonStates()
    }
    
    private func updateButtonStates() {
        let buttons = [car1, bike2, bus3]
        
        for button in buttons {
            let isSelected = button?.tag == selectedVehicleTag
            button?.isSelected = isSelected
            button?.layer.borderWidth = isSelected ? 2 : 0
            button?.layer.borderColor = isSelected ? UIColor.blue.cgColor : nil
            
            UIView.animate(withDuration: 0.2) {
                button?.layer.opacity = isSelected ? 1.0 : 0.5 // Fade effect for deselected buttons
            }
        }
    }
}

class TourRatingCell: UITableViewCell {
    @IBOutlet weak var rateBtn1: UIButton!
    @IBOutlet weak var rateBtn2: UIButton!
    @IBOutlet weak var rateBtn3: UIButton!
    @IBOutlet weak var rateBtn4: UIButton!
    @IBOutlet weak var rateBtn5: UIButton!
    
    var selectedRating = 0
    var delegate: TourRatingTVCDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func updateButtonStates() {
        let buttons = [rateBtn1, rateBtn2, rateBtn3, rateBtn4, rateBtn5]
        
        for button in buttons {
            if let btn = button {
                btn.isSelected = btn.tag <= selectedRating  // Toggle the selected state
            }
        }
    }
    
    @IBAction func rateButtonTapped(_ sender: UIButton) {
        selectedRating = sender.tag
        guard selectedRating > 0    else {
            delegate?.didShowErrorAlert(title: "Rating & Feedback", message: "Please select at least one rating.")
            return
        }
        delegate?.didSubmitRating(rating: selectedRating)
        updateButtonStates()
    }
}

class TourDetailsCell: UITableViewCell {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var teamSizeLbl: UILabel!
    
    var numberOfTeam: Int = 1 {
        didSet {
            teamSizeLbl.text = "\(numberOfTeam)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTextFields()
        teamSizeLbl.text = "\(numberOfTeam)"
    }
    
    private func setupTextFields() {
        [nameTextField, countryTextField].forEach { textField in
            textField.keyboardType = .default
            textField.applyAnimatedBorder(borderColor: .systemRed)
        }
    }
    
    @IBAction func addBtnPressed(_ sender: UIButton) {
        guard numberOfTeam > 0 else { numberOfTeam = 1; return }
        numberOfTeam += 1
    }
    
    @IBAction func removeBtnPressed(_ sender: UIButton) {
        numberOfTeam = max(1, numberOfTeam - 1)
    }
}
