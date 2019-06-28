//
//  CellFunctions.swift
//  Weather App
//
//  Created by Subham Padhi on 28/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

protocol CellFunctions {
    
    //function for registering Cell
    static func registerCell(tableView : UITableView)
    
    //function for instantiating Cell
    func cellInstantiate(tableView: UITableView,indexPath: IndexPath) -> UITableViewCell
    
    //function for handling selection event of Cell
    func didSelect(tableView: UITableView, indexPath: IndexPath)
}

extension CellFunctions {
    func didSelect(tableView: UITableView, indexPath: IndexPath) {
        
    }
}

