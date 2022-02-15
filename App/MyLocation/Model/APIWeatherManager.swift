//
//  APIWeatherManager.swift
//  WeatherApp
//
//  Created by Eugene on 14.02.2022.
//

import Foundation

struct Coordinates {
    let latitude: Double
    let longtitude: Double
}

enum ForecastType: FinalURLPoint {
    case Current(apiKey: String, coordinates: Coordinates)
    
    var baseURL: URL {
        return URL(string: "https://api.openweathermap.org/data/2.5/onecall?")!
    }
    
    var path: String {
        switch self {
        case let .Current(apiKey, coordinates):
            return "https://api.openweathermap.org/data/2.5/onecall?lat=\(coordinates.latitude)&lon=\(coordinates.longtitude)&exclude=minutely,daily,alerts&appid=\(apiKey)"
        }
    }
    
    
    var request: URLRequest {
        let url = URL(string: path)
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



