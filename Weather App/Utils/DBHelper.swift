//
//  DBHelper.swift
//  Weather App
//
//  Created by Subham Padhi on 29/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class DBHelper {
    
    static let shared = DBHelper()
    private init() {}
    
    func deleteAllForecastRealmObjects() {
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
    
    func deleteAll() {
        do {
             let realm = try Realm()
            realm.deleteAll()
        } catch let error as NSError {
            print("error - \(error.localizedDescription)")
        }
    }
}
