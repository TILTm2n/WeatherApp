//
//  LocationLabel.swift
//  WeatherApp
//
//  Created by Eugene on 13.02.2022.
//

import Foundation
import UIKit

class LocationLabel{

    var locationLabel = UILabel()
    
    init() {
        locationLabel = UILabel()
        locationLabel.text = "Somewhere"
        locationLabel.textAlignment = .center
        locationLabel.layer.shadowOpacity = 0.5
        locationLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        locationLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func changeLocation(location: String){
        locationLabel.text = location
    }
}
