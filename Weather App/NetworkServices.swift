//
//  NetworkServices.swift
//  Weather App
//
//  Created by Subham Padhi on 26/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import Moya
import UIKit

enum WeatherAPI {
    case showCurrentWeather(cityName: String)
    case showForcasedWeather(cityName: String)
}

extension WeatherAPI: TargetType {
   
    var task: Task {
        
        switch self {
        case .showCurrentWeather(cityName: let cityName):
            let params = ["q":cityName , "APPID": Constants.WEATHER_API_KEY]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .showForcasedWeather(cityName: let cityName):
             let params = ["q":cityName , "APPID": Constants.WEATHER_API_KEY]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var baseURL: URL {
        return URL(string: "https://api.openweathermap.org/data/2.5")!
    }
    
    var path: String {
        switch self {
        case .showCurrentWeather:
            return "/weather"
        case .showForcasedWeather:
            return "/forecast"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .showCurrentWeather:
            return .get
        case .showForcasedWeather:
            return .get
        }}
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        switch self {
        case .showCurrentWeather:
            return ["Content-Type":"application/json"]
        case .showForcasedWeather:
            return ["Content-Type":"application/json"]
        }
    }
}

