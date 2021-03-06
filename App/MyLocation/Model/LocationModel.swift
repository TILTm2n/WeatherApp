//
//  LocationModel.swift
//  WeatherApp
//
//  Created by Eugene on 13.02.2022.
//

import Foundation
import UIKit

struct LocationModel: Codable {
    var latitude: Double
    var longtitude: Double
    var location: String
    var current: Current
    var hours: [HourForecast]
    var daily: [DaysForecast]
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longtitude = "lon"
        case location = "timezone"
        case current
        case hours = "hourly"
        case daily
    }
}

struct Current: Codable {
    var temperature: Double
    var feeling: Double
    var wind: Double
    var weather: [Weather]
    var humidity: Double
    var date: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feeling = "feels_like"
        case wind = "wind_speed"
        case weather
        case humidity
        case date = "dt"
    }
    
    func getStringDate() -> String{
        let date = Date(timeIntervalSince1970: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "en_US")
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}

struct Weather: Codable {
    var main: String
    var description: String
    var icon: String
}

struct HourForecast: Codable {
    var temperature: Double
    var weather: [Weather]
    var date: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case weather
        case date = "dt"
    }
    
    func getStringDate() -> String{
        let date = Date(timeIntervalSince1970: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "HH:mm"
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}

struct DaysForecast: Codable {
    var dt: Double
    var temp: DaysTemperature
    var weather: [Weather]
    
    func getStringDate() -> String{
        let date = Date(timeIntervalSince1970: dt)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "MMMM d"
        dateFormatter.locale = Locale(identifier: "en_US")
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}

struct DaysTemperature: Codable {
    var day: Double
}




