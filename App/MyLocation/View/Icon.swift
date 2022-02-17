//
//  Icon.swift
//  WeatherApp
//
//  Created by Eugene on 13.02.2022.
//

import Foundation
import UIKit

struct Icon {
    var iconImage = UIImageView()
    
    init(iconName: String){
        iconImage.contentMode = .scaleAspectFill
        iconImage.image = UIImage(named: iconName)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setImage(image withName: String) {
        DispatchQueue.main.async {
            iconImage.image = UIImage(named: withName)
        }
        
    }
}
