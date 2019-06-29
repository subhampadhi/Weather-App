//
//  MainTableViewCellVM.swift
//  Weather App
//
//  Created by Subham Padhi on 29/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class MainTableViewCellVM {
    
    let tableCellTypes: [CellFunctions.Type] = [LblImgLblViewModel.self]
    private(set) var tableCells = [CellFunctions]()
    var weather_List : Results<ForecastList>?
    
    init() {
        initRealm()
        self.assignTableViewCells()
    }
    
    func assignTableViewCells() {
        self.tableCells = self.setupTableViewCells()
    }
}

extension MainTableViewCellVM {
    
    func setupTableViewCells() -> [CellFunctions] {
        var cellViewModels = [CellFunctions]()
        guard let list = weather_List else {return cellViewModels}
        for details in list {
            
            let newCell = LblImgLblViewModel(leftLabelText: getDateAttributedString(string: details.dtTxt), rightLabelText: getMinMaxAttributedString(maxString: "\(String(describing: details.main?.tempMax))", minString: "\(String(describing: details.main?.tempMin)) ?? 0.0"), imageURL: details.weather[0].icon)
            cellViewModels.append(newCell)
        }
        return cellViewModels
    }
}

extension MainTableViewCellVM {
    
    func getDateAttributedString(string:String) -> NSMutableAttributedString {
        let output = NSMutableAttributedString()
        let attrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30.0, weight: UIFont.Weight.thin)]
        let attStr = NSAttributedString(string: "\(string)" + " ", attributes: attrs)
        output.append(attStr)
        return output
    }
    
    func getMinMaxAttributedString(maxString:String , minString:String) -> NSMutableAttributedString {
        
        let output = NSMutableAttributedString()
        
        let attrs2 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)]
        let attrs3 =  [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)]
        
        let attrStr2 = NSAttributedString(string: maxString, attributes: attrs2)
        let attrStr3 = NSAttributedString(string: minString, attributes: attrs3)
        
        
        output.append(attrStr2)
        output.append(attrStr3)
        return output
    }
    
    func initRealm() {
        do {
            let realm = try Realm()
            weather_List = realm.objects(ForecastList.self)
        }catch(let error) {
            print(error)
        }
    }
}
