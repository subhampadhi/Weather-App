//
//  Session.swift
//  Weather App
//
//  Created by Subham Padhi on 28/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation

class Session {
    
    static let CURRENT_CITY:String = "CURRENT_CITY"
    
    static func setCurrentCity(city:String) {
        UserDefaults.standard.set(city, forKey: CURRENT_CITY)
    }
    
    static func getCurrentCity() -> String {
        return UserDefaults.standard.string(forKey:CURRENT_CITY) ?? ""
    }
}
