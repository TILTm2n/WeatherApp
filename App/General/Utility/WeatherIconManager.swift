//
//  WeatherIconManager.swift
//  WeatherApp
//
//  Created by Eugene on 16.02.2022.
//

import Foundation
import UIKit

enum WeatherIconManager: String {
    case ClearSkyD = "01d"
    case FewCloudsD = "02d"
    case ScatteredCloudsD = "03d"
    case BrokenCloudsD = "04d"
    case ShowerRainD = "09d"
    case RainD = "10d"
    case ThunderStormD = "11d"
    case SnowD = "13d"
    case MistD = "50d"
    
    case ClearSkyN = "01n"
    case FewCloudsN = "02n"
    case ScatteredCloudsN = "03n"
    case BrokenCloudsN = "04n"
    case ShowerRainN = "09n"
    case RainN = "10n"
    case ThunderStormN = "11n"
    case SnowN = "13n"
    case MistN = "50n"
    
    init(rawValue: String) {
        switch rawValue {
        case "01d": self = .ClearSkyD
        case "02d": self = .FewCloudsD
        case "03d": self = .ScatteredCloudsD
        case "04d": self = .BrokenCloudsD
        case "09d": self = .ShowerRainD
        case "10d": self = .RainD
        case "11d": self = .ThunderStormD
        case "13d": self = .SnowD
        case "50d": self = .MistD
            
        case "01n": self = .ClearSkyN
        case "02n": self = .FewCloudsN
        case "03n": self = .ScatteredCloudsN
        case "04n": self = .BrokenCloudsN
        case "09n": self = .ShowerRainN
        case "10n": self = .RainN
        case "11n": self = .ThunderStormN
        case "13n": self = .SnowN
        case "50n": self = .MistN
        default:
            self = .ClearSkyD
        }
    }
}

extension WeatherIconManager {
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}
