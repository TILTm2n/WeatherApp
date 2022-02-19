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
        temperature.text = "28"
        temperature.translatesAutoresizingMaskIntoConstraints = false
        temperature.font = UIFont(name: "RobotoSlab-Medium", size: 20)
        temperature.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return temperature
    }()
    
    let icon: UIImageView = {
        var icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        icon.image = UIImage(named: "cloudy")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let delineation: UILabel = {
        var delineation = UILabel()
        delineation.text = "Cloudy"
        delineation.font = UIFont(name: "RobotoSlab-Light", size: 18)
        delineation.translatesAutoresizingMaskIntoConstraints = false
        delineation.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return delineation
    }()
    
    let cityName: UILabel = {
        var name = UILabel()
        name.text = "Simpheropol"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont(name: "RobotoSlab-Medium", size: 20)
        name.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(icon)
        contentView.addSubview(cityName)
        contentView.layer.cornerRadius = 20
        contentView.addSubview(temperature)
        contentView.addSubview(delineation)
        contentView.backgroundColor = .white
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
        NSLayoutConstraint.activate([
            temperature.heightAnchor.constraint(equalToConstant: 26.0),
            temperature.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            temperature.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22.0)
        ])
    }
    
    fileprivate func iconConstraints() {
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: 80.0),
            icon.heightAnchor.constraint(equalToConstant: 80.0),
            icon.topAnchor.constraint(equalTo: temperature.bottomAnchor),
            icon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    fileprivate func delineationConstraints() {
        NSLayoutConstraint.activate([
            delineation.heightAnchor.constraint(equalToConstant: 24.0),
            delineation.topAnchor.constraint(equalTo: icon.bottomAnchor),
            delineation.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    fileprivate func cityNameConstraints() {
        NSLayoutConstraint.activate([
            cityName.topAnchor.constraint(equalTo: delineation.bottomAnchor),
            cityName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cityName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22.0)
        ])
    }
}
