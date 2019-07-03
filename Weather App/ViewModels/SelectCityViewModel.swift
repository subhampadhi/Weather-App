//
//  SelectCityViewModel.swift
//  Weather App
//
//  Created by Subham Padhi on 28/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import Moya
import RealmSwift

class SelectCityViewModel {
    
    var moveToNextScreen: (() ->())?
    var showErrorInCityName: (() -> ())?
    var dispatchGroup = DispatchGroup()
    var isComingFromMainTableVC: Bool
    let provider = MoyaProvider<WeatherAPI>()
    
    init(isComingFromMainTableVC: Bool) {
        self.isComingFromMainTableVC = isComingFromMainTableVC
    }
}

extension SelectCityViewModel {
    
    func callBothWeatherAPI(place:String , vc:UIViewController) {
        getTodayWeather(place: place)
        getWeatherForecast(place: place, vc: vc)
        dispatchGroup.notify(queue: .main) { [weak self] in
            print("Done finally")
            self?.moveToNextScreen?()
        }
    }
    
    func getTodayWeather(place: String) {
        AppUtils.showActivityIndicator()
       
        dispatchGroup.enter()
        provider.request(.showCurrentWeather(cityName:place)) { (result) in
            switch result {
            
            case .success(let response):
                if response.statusCode == 200 {
                let value = try! response.map(CurrentWeatherBase.self)
                do {
                    let realm = try Realm()
                    print(realm.configuration.fileURL?.absoluteString ?? "")
                    try realm.write {
                        realm.add(value , update: .modified)
                    }
                } catch(let error) {
                    print(error.localizedDescription)
                }
                if self.isComingFromMainTableVC {
                    // TODO
                }else {
                    print("Done From 1")
                    }
                } else {
                    self.showErrorInCityName?()
                }
            case .failure(let error):
                return print("\(error.localizedDescription)")
            }
            self.dispatchGroup.leave()
        }
    }
    
    func getWeatherForecast(place: String , vc: UIViewController) {
        
        AppUtils.showActivityIndicator()
        dispatchGroup.enter()
        provider.request(.showForcasedWeather(cityName:place)) { (result) in
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    DBHelper.shared.deleteAllForecastRealmObjects()
                    let value = try! response.map(ForecastWeatherBase.self)
                    do {
                        let realm = try Realm()
                        print(realm.configuration.fileURL?.absoluteString ?? "")
                        try realm.write {
                            realm.add(value, update: .all)
                        }
                    } catch(let error) {
                        AppUtils.showAlert(title: "Oops", message: error.localizedDescription, presenter: vc)
                    }
                    print("Done")
                } else {
                    AppUtils.showAlert(title: "Oops", message: response.description, presenter: vc)
                }
            case .failure(let error):
                AppUtils.showAlert(title: "Oops", message:error.localizedDescription , presenter: vc)
            }
            self.dispatchGroup.leave()
        }
    }
}




