//
//  MyCollectionViewCell.swift
//  WeatherApp
//
//  Created by Eugene on 13.02.2022.
//

import Foundation
import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CityCell"
    
    let temperature: UILabel = {
        var temperature = UILabel()
        temperature.translatesAutoresizingMaskIntoConstraints = false
        temperature.text = "28"
        temperature.font = UIFont(name: "RobotoSlab-Medium", size: 20)
        temperature.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return temperature
    }()
    
    let icon: UIImageView = {
        var icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFill
        icon.image = UIImage(named: "cloudy")
        return icon
    }()
    
    let delineation: UILabel = {
        var delineation = UILabel()
        delineation.translatesAutoresizingMaskIntoConstraints = false
        delineation.text = "Cloudy"
        delineation.font = UIFont(name: "RobotoSlab-Light", size: 18)
        delineation.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return delineation
    }()
    
    let cityName: UILabel = {
        var name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Simpheropol"
        name.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        name.font = UIFont(name: "RobotoSlab-Medium", size: 20)
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        
        contentView.addSubview(temperature)
        contentView.addSubview(icon)
        contentView.addSubview(delineation)
        contentView.addSubview(cityName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        temperatureConstraints()
        iconConstraints()
        delineationConstraints()
        cityNameConstraints()
        
    }
    
    fileprivate func temperatureConstraints() {
        temperature.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22.0).isActive = true
        temperature.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        temperature.heightAnchor.constraint(equalToConstant: 26.0).isActive = true
    }
    
    fileprivate func iconConstraints() {
        icon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        icon.topAnchor.constraint(equalTo: temperature.bottomAnchor).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
    }
    
    fileprivate func delineationConstraints() {
        delineation.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        delineation.topAnchor.constraint(equalTo: icon.bottomAnchor).isActive = true
        delineation.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
    }
    
    fileprivate func cityNameConstraints() {
        cityName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        cityName.topAnchor.constraint(equalTo: delineation.bottomAnchor).isActive = true
        cityName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22.0).isActive = true
    }
    
}
