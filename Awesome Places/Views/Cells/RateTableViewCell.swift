//
//  RateTableViewCell.swift
//  Awesome Places
//
//  Created by Gaurav Patel on 12/03/25.
//

import UIKit

protocol DestinationRatingTVCDelegate: AnyObject {
    func didSubmitFeedbackSuccessfully(rating: Int, feedback: String?)
    func didShowErrorAlert(title: String, message: String)
}

class RateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rateBtn1: UIButton!
    @IBOutlet weak var rateBtn2: UIButton!
    @IBOutlet weak var rateBtn3: UIButton!
    @IBOutlet weak var rateBtn4: UIButton!
    @IBOutlet weak var rateBtn5: UIButton!
    
    @IBOutlet weak var feedbackTextField: UITextField!
    
    var selectedRating = 0
    var delegate: DestinationRatingTVCDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        feedbackTextField.delegate = self
        feedbackTextField.keyboardType = .default
        feedbackTextField.applyAnimatedBorder(borderColor: .systemRed)
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
        selectedRating = sender.tag // Get the selected rating
        updateButtonStates()
    }
    
    @IBAction func submitBtnPressed(_ sender: UIButton) {
        guard selectedRating > 0 else {
            delegate?.didShowErrorAlert(title: "Rating & Feedback", message: "Please select at least one rating. Feedback is optional.")
            return
        }
        let feedback = feedbackTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        delegate?.didSubmitFeedbackSuccessfully(rating: selectedRating, feedback: feedback)
    }
    
}

extension RateTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        super.endEditing(true)
    }
}
