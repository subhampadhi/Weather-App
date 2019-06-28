//
//  WeatherMainTableVC.swift
//  Weather App
//
//  Created by Subham Padhi on 28/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
class WeatherMainTableVC: MainTableView {
    
    var isPresentedAsRootVC: Bool
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    init(isPresentedAsRootVC:Bool) {
        self.isPresentedAsRootVC = isPresentedAsRootVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
