//
//  WeatherMainTableVC.swift
//  Weather App
//
//  Created by Subham Padhi on 28/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class WeatherMainTableVC: MainTableView {
    
    var isPresentedAsRootVC: Bool
    var mainTableViewCellVM = MainTableViewCellVM()

    override func viewDidLoad() {
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setUpViews()
        weatherTable.dataSource = self
        weatherTable.delegate = self
        
    }
    
    init(isPresentedAsRootVC:Bool) {
        self.isPresentedAsRootVC = isPresentedAsRootVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeatherMainTableVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainTableViewCellVM.tableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = self.mainTableViewCellVM.tableCells[indexPath.row]
        return cellViewModel.cellInstantiate(tableView: tableView,indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension WeatherMainTableVC: UITableViewDelegate {
    
}



