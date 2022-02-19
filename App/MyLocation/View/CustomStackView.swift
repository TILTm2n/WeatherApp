//
//  CustomStackView.swift
//  WeatherApp
//
//  Created by Eugene on 13.02.2022.
//

import Foundation
import UIKit

class CustomStackView {

    var stackView = UIStackView()
    
    private var tempTitle: UILabel?
    private var tempLabel: UILabel?
    
    private var humidityTitle: UILabel?
    private var humidityLabel: UILabel?
    
    private var windTitle: UILabel?
    private var windLabel: UILabel?
    
    init() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        for i in 0...2 {
            stackView.addArrangedSubview(createBlock(index: i, value: 0))
        }
    }
    
    func changeValues(temp: Int, humidity: Int, speed: Int) {
        DispatchQueue.main.async {
            self.tempLabel?.text = "\(temp - 273)C"
            self.humidityLabel?.text = "\(humidity)%"
            self.windLabel?.text = "\(speed)km/h"
        }
        
    }
    
    func createBlock(index: Int, value: Double) -> UIStackView {

        let valueBlock = UIStackView()
        valueBlock.translatesAutoresizingMaskIntoConstraints = false
        valueBlock.axis = .vertical
        valueBlock.distribution = .fillEqually
        valueBlock.alignment = .center
        
        let localTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 15))
        let localLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 20))
        
        localTitle.textColor = .white
        localLabel.textColor = .white
        
        localTitle.translatesAutoresizingMaskIntoConstraints = false
        localLabel.translatesAutoresizingMaskIntoConstraints = false
        
        valueBlock.addArrangedSubview(localTitle)
        valueBlock.addArrangedSubview(localLabel)
        
        localTitle.font = UIFont.systemFont(ofSize: 15)
        localLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        localTitle.textAlignment = .center
        localLabel.textAlignment = .center
        
        if index == 0 {
            tempTitle = localTitle
            tempLabel = localLabel
            
            tempTitle?.text = "Feels like"
            tempLabel?.text = "\(Int(value))C"
        } else if index == 1 {
            humidityTitle = localTitle
            humidityLabel = localLabel
            
            humidityTitle?.text = "Humidity"
            humidityLabel?.text = "\(Int(value))%"
        } else if index == 2 {
            windTitle = localTitle
            windLabel = localLabel
            
            windTitle?.text = "Wind"
            windLabel?.text = "\(Int(value))km/h"
        }
        
        return valueBlock
    }
}
