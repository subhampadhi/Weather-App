//
//  SearchScreenView.swift
//  Weather App
//
//  Created by Subham Padhi on 27/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class SearchScreenView : UIViewController {
    
    var staticLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose Your City"
        label.font = UIFont(name: "Nunito-Regular", size: 20)
        label.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 0
        return label
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("GET WEATHER", for: .normal)
        button.titleLabel?.font = UIFont(name: "Nunito", size: 14)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.addTarget(self, action: #selector(SelectCityVC.getWeatherButtonPressed), for: .touchUpInside)
        return button
    }()

    
     var placeTextField: UITextField = {
        let nameText = UITextField()
        nameText.translatesAutoresizingMaskIntoConstraints = false
        nameText.placeholder = "Eg. London"
        nameText.setPadding()
        nameText.setBottomBorder()
        
        nameText.autocapitalizationType = .allCharacters
        nameText.font = UIFont(name: "Nunito-Regular", size: 14)
        return nameText
    }()
    
    func setUpViews() {
        view.addSubview(placeTextField)
        view.addSubview(staticLabel1)
        view.addSubview(nextButton)
        
        placeTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        placeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        placeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        placeTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        staticLabel1.bottomAnchor.constraint(equalTo: placeTextField.topAnchor, constant: -20).isActive = true
        staticLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        staticLabel1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

extension UITextField {
    func setPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.width - 4))
        self.leftView = paddingView
        
        self.leftViewMode = .always
    }
    
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 0.0
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
