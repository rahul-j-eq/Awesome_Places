//
//  Keyboard Manager.swift
//  Awesome Places
//
//  Created by Gaurav Patel on 13/03/25.
//

import UIKit

extension UIResponder {
    private static weak var _currentFirstResponder: UIResponder?
    
    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(findFirstResponder), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }
    
    @objc private func findFirstResponder() {
        UIResponder._currentFirstResponder = self
    }
}

extension UIViewController {
    
    func setupKeyboardHandling() {
        let center = NotificationCenter.default
        let notifications: [(Selector, Notification.Name)] = [
            (#selector(keyboardWillShow(_:)), UIResponder.keyboardWillShowNotification),
            (#selector(keyboardWillHide(_:)), UIResponder.keyboardWillHideNotification)
        ]
        
        for (selector, name) in notifications {
            center.addObserver(self, selector: selector, name: name, object: nil)
        }
        
        hideKeyboardWhenTappedAround()
    }

    func removeKeyboardHandling() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        let bottomInset = keyboardFrame.height + 20 // Extra padding
        
        if let scrollView = findScrollView() {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
            scrollView.scrollIndicatorInsets = scrollView.contentInset
            
            if let activeField = UIResponder.currentFirstResponder as? UITextField {
                scrollToTextField(activeField, in: scrollView)
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        if let scrollView = findScrollView() {
            scrollView.contentInset = .zero
            scrollView.scrollIndicatorInsets = .zero
        }
    }
    
    private func findScrollView(in view: UIView? = nil) -> UIScrollView? {
        let searchView = view ?? self.view
        if let scrollView = searchView as? UIScrollView {
            return scrollView
        }
        for subview in searchView?.subviews ?? [] {
            if let foundScrollView = findScrollView(in: subview) {
                return foundScrollView
            }
        }
        return nil
    }
    
    private func scrollToTextField(_ textField: UITextField, in scrollView: UIScrollView) {
        let textFieldFrame = textField.convert(textField.bounds, to: scrollView)
        let visibleRect = CGRect(origin: scrollView.contentOffset, size: scrollView.bounds.size).inset(by: scrollView.contentInset)
        
        if !visibleRect.intersects(textFieldFrame) {
            scrollView.scrollRectToVisible(textFieldFrame, animated: true)
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
