//
//  ViewController.swift
//  WeatherApp
//
//  Created by Eugene on 13.02.2022.
//

import UIKit

class ViewController: UIViewController {
    let locationVC = LocationViewController()
    let searchVC = SearchViewController()
    let forecastVC = ForecastViewController()
    let settingsVC = SettingsViewController()
    
    var locationItem = UITabBarItem()
    var searchItem = UITabBarItem()
    var forecastItem = UITabBarItem()
    var settingsItem = UITabBarItem()
    
    let tabBarC = CustomTabBarController()
    
    fileprivate func setTabBarItems() {
        locationItem = UITabBarItem(title: "My Location", image: UIImage(named: "location3x"), tag: 0)
        //searchItem = UITabBarItem(title: "Search", image: UIImage(named: "search3x"), tag: 1)
        forecastItem = UITabBarItem(title: "Forecast", image: UIImage(named: "forecast3x"), tag: 2)
        //settingsItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings3x"), tag: 3)
        
        locationVC.tabBarItem = locationItem
        //searchVC.tabBarItem = searchItem
        forecastVC.tabBarItem = forecastItem
        //settingsVC.tabBarItem = settingsItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarItems()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        tabBarC.setViewControllers([locationVC,
//                                    searchVC,
//                                    forecastVC,
//                                    settingsVC], animated: true)
        tabBarC.setViewControllers([locationVC, forecastVC,], animated: true)
        
        tabBarC.tabBar.backgroundColor = UIColor(named: "tabBarColorLight")
        present(tabBarC, animated: true, completion: nil)
    }
    
}

