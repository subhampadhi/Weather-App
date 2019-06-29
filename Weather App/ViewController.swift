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
                    self.realmDeleteAllClassObjects()
                    let value = try! response.map(ForecastWeatherBase.self)
                    do {
                        let realm = try Realm()
                        print(realm.configuration.fileURL?.absoluteString ?? "")
                        try realm.write {
                            realm.add(value, update: .all)
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
    
    func realmDeleteAllClassObjects() {
        do {
            let realm = try Realm()
    
            let forecastWeatherBase = realm.objects(ForecastWeatherBase.self)
            let forecastList = realm.objects(ForecastList.self)
            let forecastWind = realm.objects(ForecastWind.self)
            let forecastWeather = realm.objects(ForecastWeather.self)
            let forecastSy = realm.objects(ForecastSy.self)
            let forecastMain = realm.objects(ForecastMain.self)
            let forecastCloud = realm.objects(ForecastCloud.self)
            let forecastCity = realm.objects(ForecastCity.self)
            let forecastCoord = realm.objects(ForecastCoord.self)
            try! realm.write {
                realm.delete(forecastWeatherBase)
                realm.delete(forecastList)
                realm.delete(forecastWind)
                realm.delete(forecastWeather)
                realm.delete(forecastSy)
                realm.delete(forecastMain)
                realm.delete(forecastCloud)
                realm.delete(forecastCity)
                realm.delete(forecastCoord)
            }
        } catch let error as NSError {
            // handle error
            print("error - \(error.localizedDescription)")
        }
    }

}
