//
//  WeatherIconManager.swift
//  WeatherApp
//
//  Created by Eugene on 16.02.2022.
//

import Foundation
import UIKit

enum WeatherIconManager: String {
    case ClearSky = "01d"
    case FewClouds = "02d"
    case ScatteredClouds = "03d"
    case BrokenClouds = "04d"
    case ShowerRain = "09d"
    case Rain = "10d"
    case ThunderStorm = "11d"
    case Snow = "13d"
    case Mist = "50d"
    
    init(rawValue: String) {
        switch rawValue {
        case "01d": self = .ClearSky
        case "02d": self = .FewClouds
        case "03d": self = .ScatteredClouds
        case "04d": self = .BrokenClouds
        case "09d": self = .ShowerRain
        case "10d": self = .Rain
        case "11d": self = .ThunderStorm
        case "13d": self = .Snow
        case "50d": self = .Mist
        default:
            self = .ClearSky
        }
    }
}
