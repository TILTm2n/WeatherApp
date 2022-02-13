//
//  CustomTabBarController.swift
//  WeatherApp
//
//  Created by Eugene on 13.02.2022.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalPresentationStyle = .fullScreen
        self.tabBar.barTintColor = UIColor(named: "tabBarColorLight")
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .black
        self.tabBar.layer.cornerRadius = 25
        
    }

}
