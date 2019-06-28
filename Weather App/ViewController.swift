//
//  ViewController.swift
//  Weather App
//
//  Created by Subham Padhi on 25/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import UIKit
import Moya
import Foundation
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var testingLabel : UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        getTodayWeather(place: "London")
        
        // Do any additional setup after loading the view.
        
}
    
    func getTodayWeather(place: String) {
        
        let provider = MoyaProvider<WeatherAPI>()
        provider.request(.showForcasedWeather(cityName:place)) { (result) in
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    let value = try! response.map(ForecastWeatherBase.self)
                    do {
                        let realm = try Realm()
                        print(realm.configuration.fileURL?.absoluteString ?? "")
                        try realm.write {
                            realm.add(value , update: .all)
                        }
                    } catch(let error) {
                        print(error.localizedDescription)
                    }
                } else {
                    print(response.data)
                }
            case .failure(let error):
                return print("\(error.localizedDescription)")
            }
        }
    }

}
