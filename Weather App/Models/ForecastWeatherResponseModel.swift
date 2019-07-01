//
//  ForecastWeatherResponseModel.swift
//  Weather App
//
//  Created by Subham Padhi on 28/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objcMembers class ForecastWeatherBase : RealmSwift.Object , Decodable {

    dynamic var cod : String = ""
    dynamic var message : Double = 0.0
    dynamic var city : ForecastCity?
    dynamic var cnt : Int = 0
    let list = RealmSwift.List<ForecastList>()
    dynamic var id = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(city: ForecastCity?) {
        self.init()
        self.city = city
    }
    
    enum CodingKeys: String, CodingKey {
        case city = "city"
        case cnt = "cnt"
        case cod = "cod"
        case list = "list"
        case message = "message"
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cod = try values.decode(String.self, forKey: .cod)
        message = try values.decode(Double.self, forKey: .message)
        city = try values.decodeIfPresent(ForecastCity.self, forKey: .city)
        cnt = try values.decode(Int.self, forKey: .cnt)
        do {
            let weatherList = try values.decode([ForecastList].self, forKey: .list)
            for w in weatherList {
                list.append(w)
            }
        } catch (let error) {
            print(error)
        }
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init() {
        super.init()
    }
}

@objcMembers class ForecastList : Object , Decodable {
    
    dynamic var clouds : ForecastCloud? // ch
    dynamic var dt : Int = 0 // ch
    dynamic var  dtTxt : String = "" //ch
    dynamic var main : ForecastMain? // ch
   // dynamic var rain : ForecastRain?
    dynamic var sys : ForecastSy? //ch
    let weather = RealmSwift.List<ForecastWeather>() // ch
    dynamic var wind : ForecastWind? // ch
    
    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case clouds = "clouds"
        case dtTxt = "dt_txt"
        case main = "main"
      //  case rain = "rain"
        case sys = "sys"
        case weather = "weather"
        case wind = "wind"
    }
    
    convenience init(clouds: ForecastCloud?, main: ForecastMain?, sys: ForecastSy?, wind: ForecastWind?) {
        self.init()
        self.clouds = clouds
        self.main = main
        self.sys = sys
        self.wind = wind
    }
    

    required  init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        clouds = try values.decodeIfPresent(ForecastCloud.self, forKey: .clouds)
        dt = try values.decode(Int.self, forKey: .dt)
        dtTxt = try values.decode(String.self, forKey: .dtTxt)
        main = try values.decodeIfPresent(ForecastMain.self, forKey: .main)
      //  rain = try values.decodeIfPresent(ForecastRain.self, forKey: .rain)
        sys = try values.decodeIfPresent(ForecastSy.self, forKey: .sys)
        wind = try values.decodeIfPresent(ForecastWind.self, forKey: .wind)
        
        if let weatherList = try? values.decode([ForecastWeather].self, forKey: .weather){
            weather.append(objectsIn: weatherList)
        }
        super.init()
    }
    
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
        
    }
    
    required init() {
        super.init()
    }
}

@objcMembers class ForecastWind : Object , Decodable {
    
    dynamic var deg : Double = 0.0
    dynamic var speed : Double = 0.0
    
    convenience init(deg:Double , speed:Double) {
         self.init()
        self.deg = deg
        self.speed = speed
    }
    
    enum CodingKeys: String, CodingKey {
        case deg = "deg"
        case speed = "speed"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        deg = try values.decode(Double.self, forKey: .deg)
        speed = try values.decode(Double.self, forKey: .speed)
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init() {
        super.init()
    }

}

@objcMembers class ForecastWeather : Object, Decodable {
    
    dynamic var descriptionField : String = ""
    dynamic var icon : String = ""
    dynamic var id : Int = 0
    dynamic var main : String = ""
    
    enum CodingKeys: String, CodingKey {
        case descriptionField = "description"
        case icon = "icon"
        case id = "id"
        case main = "main"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        descriptionField = try values.decode(String.self, forKey: .descriptionField)
        icon = try values.decode(String.self, forKey: .icon)
        id = try values.decode(Int.self, forKey: .id)
        main = try values.decode(String.self, forKey: .main)
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
       super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init()
    }
    
    required init() {
        super.init()
    }
}


@objcMembers class ForecastSy : Object, Decodable {
    
    dynamic var pod : String = ""
    
    enum CodingKeys: String, CodingKey {
        case pod = "pod"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pod = try values.decode(String.self, forKey: .pod)
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init() {
        super.init()
    }
}


@objcMembers class ForecastRain : Object, Decodable {
    
    dynamic var h3 : Double = 0.0
    
    enum CodingKeys: String, CodingKey {
        case h3 = "3h"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        h3 = try values.decode(Double.self, forKey: .h3)
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init() {
        super.init()
    }
    
}

@objcMembers class ForecastMain : Object , Decodable {
    
    dynamic var grndLevel : Double = 0.0
    dynamic var humidity : Int = 0
    dynamic var pressure : Double = 0.0
    dynamic var seaLevel : Double = 0.0
    dynamic var temp : Double = 0.0
    dynamic var tempKf : Double = 0.0
    dynamic var tempMax : Double = 0.0
    dynamic var tempMin : Double = 0.0
    
    convenience init( grndLevel : Double ,humidity : Int , pressure : Double , seaLevel : Double , temp : Double , tempKf : Double , tempMax : Double , tempMin : Double) {
        self.init()
        self.grndLevel = grndLevel
        self.humidity = humidity
        self.pressure = pressure
        self.seaLevel = seaLevel
        self.temp = temp
        self.tempKf = tempKf
        self.tempMin = tempMin
        self.tempMax = tempMax
    }
    
    enum CodingKeys: String, CodingKey {
        case grndLevel = "grnd_level"
        case humidity = "humidity"
        case pressure = "pressure"
        case seaLevel = "sea_level"
        case temp = "temp"
        case tempKf = "temp_kf"
        case tempMax = "temp_max"
        case tempMin = "temp_min"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        grndLevel = try values.decode(Double.self, forKey: .grndLevel)
        humidity = try values.decode(Int.self, forKey: .humidity)
        pressure = try values.decode(Double.self, forKey: .pressure)
        seaLevel = try values.decode(Double.self, forKey: .seaLevel)
        temp = try values.decode(Double.self, forKey: .temp)
        tempKf = try values.decode(Double.self, forKey: .tempKf)
        tempMax = try values.decode(Double.self, forKey: .tempMax)
        tempMin = try values.decode(Double.self, forKey: .tempMin)
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init()
        
    }
    
    required init() {
        super.init()
    }
    
    
}

@objcMembers class ForecastCloud : Object , Decodable {
    
    dynamic var all : Int = 0
    
    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
    
    convenience init( all : Int ) {
        self.init()
        self.all = all
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        all = try values.decode(Int.self, forKey: .all)
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init() {
        super.init()
    }
    
}

@objcMembers class ForecastCity : Object, Decodable {
    
    dynamic var coord : ForecastCoord?
    dynamic var country : String = ""
    dynamic var id : Int = 0
    dynamic var name : String = ""
    dynamic var population : Int = 0
    dynamic var timezone : Int = 0
    
    enum CodingKeys: String, CodingKey {
        case coord = "coord"
        case country = "country"
        case id = "id"
        case name = "name"
        case population = "population"
        case timezone = "timezone"
    }
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    convenience init(coord: ForecastCoord?) {
        self.init()
        self.coord = coord
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        coord = try values.decodeIfPresent(ForecastCoord.self, forKey: .coord)
        country = try values.decode(String.self, forKey: .country)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        population = try values.decode(Int.self, forKey: .population)
        timezone = try values.decode(Int.self, forKey: .timezone)
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init() {
        super.init()
    }
}

@objcMembers class ForecastCoord : Object , Decodable {
    
    dynamic var lat : Double = 0.0
    dynamic var lon : Double = 0.0
    
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
    }
    
    convenience init(lat : Double , lon : Double) {
        self.init()
        self.lat = lat
        self.lon = lon
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decode(Double.self, forKey: .lat)
        lon = try values.decode(Double.self, forKey: .lon)
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init() {
        super.init()
    }
}

