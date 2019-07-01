//
//  AppUtils.swift
//  Weather App
//
//  Created by Subham Padhi on 28/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class AppUtils {
    
    static func getDateTime() -> String {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        let dateTime = formatter.string(from: currentDateTime)
        return dateTime
        
    }
    
    static func getURLForIcons(icon: String) -> String {
        return "https://openweathermap.org/img/wn/\(icon)@2x.png"
    }
    
    static func showAlert(title: String, message: String, presenter: UIViewController) {
        // create the alert
        let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        presenter.present(alert, animated: true, completion: nil)
    }
    
    static func showAlertWithCustomFunction(title: String, message: String, presenter: UIViewController, handler: ((UIAlertAction) -> Swift.Void)?) {
        let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: handler))
        
        // show the alert
        presenter.present(alert, animated: true, completion: nil)
    }
    
    static func showAlertWithAction(title: String, message: String, presenter: UIViewController) {
        // create the alert
        let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
            action in
            if (action.style == .default) {
                if let navController = presenter.navigationController {
                    navController.popViewController(animated: true)
                }
            }
        }))
        
}
    static func validateTextFieldForEmpty(textField: UITextField) -> Bool {
        
        if textField.text == "" || textField.text == nil {
            return false
        }
        return true
    }
    
    static func validateForNumbersAndSpecialCharacters(textField: UITextField) -> Bool {
        
        if checkNumber(password: textField.text!) {
            return false
        }
        if checkSpecialCharacter(password: textField.text!) {
            return false
        }
        return true
    }
    
    static func checkNumber(password:String) -> Bool {
        
        let numberRegEx  = ".*[0-9]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberresult = texttest.evaluate(with: password)
        return numberresult
        
    }
    
    static func checkSpecialCharacter(password:String) -> Bool {
        
        let specialCharacterRegEx  = ".*[!&^%$#@()/?]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        let specialresult = texttest.evaluate(with: password)
        return specialresult
    }
    
    static func showActivityIndicator() {
        print("Loading")
    }
    
    static func hideActivityIndicator() {
        print("Done Loading")
    }
    
    static func getFormattedDate(date:String) -> String {
        
        let myDateString = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myDate = dateFormatter.date(from: myDateString)!
        dateFormatter.dateFormat = "MMM dd, YYYY"
        let somedateString = dateFormatter.string(from: myDate)
        return somedateString
    }
}

