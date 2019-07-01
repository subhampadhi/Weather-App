//
//  SelectCityVC.swift
//  Weather App
//
//  Created by Subham Padhi on 27/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class SelectCityVC: SearchScreenView {
    
    let vm = SelectCityViewModel(isComingFromMainTableVC: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.addKeyboardNotifications()
        self.hideKeyboardWhenTappedAround()
        setUpViews()
        handleCallbacks()
    }
    
    func addLabel() {
        let output = NSMutableAttributedString()
        
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20) ]
        let attrs2 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30.0, weight: UIFont.Weight.thin)]
        let attrs3 =  [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 50.0, weight: UIFont.Weight.thin)]
        
        let attStr = NSAttributedString(string: "Banglore" + "\n", attributes: attrs)
        let attrStr2 = NSAttributedString(string: "coudy", attributes: attrs2)
        let attrStr3 = NSAttributedString(string: "30", attributes: attrs3)
       
        output.append(attStr)
        output.append(attrStr2)
        output.append(attrStr3)
        staticLabel1.attributedText = output
        
    }
}

extension SelectCityVC {
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 20
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    @objc func getWeatherButtonPressed() {
        if !AppUtils.validateTextFieldForEmpty(textField: placeTextField) {
            AppUtils.showAlert(title: "Oops", message: "Don't Leave the Field Empty", presenter: self)
            return
        }
        if !AppUtils.validateForNumbersAndSpecialCharacters(textField: placeTextField) {
            AppUtils.showAlert(title: "Well !!", message: "Place don't have numbers or special characters I guess . I may be wrong though ", presenter: self)
            return
        }
        vm.callBothWeatherAPI(place: placeTextField.text!, vc: self)
    }
    
    func addKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

extension SelectCityVC {
    
    func handleCallbacks() {
        vm.moveToNextScreen = { () in
            let vc = WeatherMainTableVC(isPresentedAsRootVC: false)
            guard let city = self.placeTextField.text else {return}
            Session.setCurrentCity(city: city)
            print(Session.getCurrentCity())
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        vm.showErrorInCityName = { () in
            AppUtils.showAlert(title: "Oops", message: "We guess there is no city as such", presenter: self)
        }
    }

}

