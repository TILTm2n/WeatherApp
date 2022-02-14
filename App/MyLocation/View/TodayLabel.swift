//
//  TodayLabel.swift
//  WeatherApp
//
//  Created by Eugene on 13.02.2022.
//

import Foundation
import UIKit

struct Today {
    var label = UILabel()
    
    init(){
        label.text = "Today"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.textColor = UIColor(red: 1, green: 0.996, blue: 0.996, alpha: 1)
    }
}
