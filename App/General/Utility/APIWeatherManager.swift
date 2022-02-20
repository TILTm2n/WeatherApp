//
//  APIWeatherManager.swift
//  WeatherApp
//
//  Created by Eugene on 14.02.2022.
//

import Foundation

struct Coordinates {
    private var latitude: Double
    private var longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var Latitude: Double {
        get {
            return latitude
        }
        set(newLatitude) {
            latitude = newLatitude
        }
    }
    
    var Longitude: Double {
        get {
            return latitude
        }
        set(newLongitude) {
            longitude = newLongitude
        }
    }
}

enum ForecastType: FinalURLPoint {
    case Current(apiKey: String, coordinates: Coordinates)
    
    var baseURL: URL {
        return URL(string: "https://api.openweathermap.org/data/2.5/")!
    }
    
    var path: String {
        switch self {
        case let .Current(apiKey, coordinates):
            return "onecall?lat=\(coordinates.Latitude)&lon=\(coordinates.Longitude)&exclude=minutely,daily,alerts&appid=\(apiKey)"
        }
    }
    
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: baseURL)
        return URLRequest(url: url!)
    }
    
    
}

final class APIWeatherManager: APIManager {
    var sessionConfiguration: URLSessionConfiguration
    lazy var session: URLSession = {
        return URLSession(configuration: self.sessionConfiguration)
    }()
    
    let apiKey: String
    
    init(sessionConfiguration: URLSessionConfiguration, apiKey: String) {
        self.sessionConfiguration = sessionConfiguration
        self.apiKey = apiKey
    }
    
    convenience init(apiKey: String) {
        self.init(sessionConfiguration: URLSessionConfiguration.default, apiKey: apiKey)
    }
    
    func fetchCurrentWeatherWith(coordinates: Coordinates, completionHandler: @escaping ((APIResult<LocationModel>) -> Void)) {
        let request = ForecastType.Current(apiKey: apiKey, coordinates: coordinates).request
        
        fetch(request: request, completionHandler: completionHandler)
    }
    
}



