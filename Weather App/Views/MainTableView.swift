//
//  HomeView.swift
//  Weather App
//
//  Created by Subham Padhi on 27/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class MainTableView: UIViewController {
    
    var weatherTable:UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setUpViews() {
        navigationItem.title = "Weather Today"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        view.addSubview(weatherTable)
        weatherTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        weatherTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        weatherTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        weatherTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        weatherTable.estimatedRowHeight = 180
        weatherTable.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        weatherTable.rowHeight = UITableView.automaticDimension
    }
}
