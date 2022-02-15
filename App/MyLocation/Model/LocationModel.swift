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
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longtitude = "lon"
        case location = "timezone"
        case current
    }
}

struct Current: Codable {
    var temperature: Double
    var feeling: Double
    var wind: Double
    var weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feeling = "feels_like"
        case wind = "wind_speed"
        case weather
        
    }
}

struct Weather: Codable {
    var main: String
    var description: String
    var icon: String
}



