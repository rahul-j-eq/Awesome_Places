//
//  UITextField + animation.swift
//  Awesome Places
//
//  Created by Gaurav Patel on 13/03/25.
//

import UIKit

extension UITextField {
    
    func applyAnimatedBorder(borderColor: UIColor = .blue) {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.addTarget(self, action: #selector(startEditingAnimation), for: .editingDidBegin)
        self.addTarget(self, action: #selector(stopEditingAnimation), for: .editingDidEnd)
        
        self.tag = borderColor == .blue ? 0 : 1 // Simple way to differentiate color
    }
    
    @objc private func startEditingAnimation() {
        let color: UIColor = self.tag == 0 ? .blue : .red
        animateBorderColor(to: color.cgColor, width: 2)
    }
    
    @objc private func stopEditingAnimation() {
        animateBorderColor(to: UIColor.lightGray.cgColor, width: 1)
    }
    
    private func animateBorderColor(to color: CGColor, width: CGFloat) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                self.layer.borderColor = color
                self.layer.borderWidth = width
            }
        }
    }
}
