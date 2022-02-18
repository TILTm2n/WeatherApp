//
//  LocationCollectionViewCell.swift
//  WeatherApp
//
//  Created by Eugene on 13.02.2022.
//

import Foundation
import UIKit

class LocationCollectionViewCell: UICollectionViewCell {
    static let identifier = "LocationCollectionCell"
    
    var temperature: UILabel = {
        var temperature = UILabel()
        temperature.translatesAutoresizingMaskIntoConstraints = false
        temperature.text = "28C"
        temperature.font = UIFont(name: "RobotoSlab-Medium", size: 17)
        temperature.textColor = .black
        return temperature
    }()
    
    let time: UILabel = {
        var time = UILabel()
        time.translatesAutoresizingMaskIntoConstraints = false
        time.text = "10:00am"
        time.font = UIFont(name: "RobotoSlab-Medium", size: 12)
        time.textColor = .black
        return time
    }()
    
    let icon: UIImageView = {
        var icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFill
        icon.image = UIImage(named: "cloudy")
        
        //icon.image = UIImage(named: "rain")
        return icon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        
        contentView.addSubview(temperature)
        contentView.addSubview(time)
        contentView.addSubview(icon)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconConstraints()
        temperatureConstraints()
        timeConstraints()
    }

    func setTemperature(temp: Double) {
        self.temperature.text = String(Double(round(1000 * (temp - 273)) / 1000))
    }
    //check token
    
    func setIcon(icon: String) {
        self.icon.image = UIImage(named: icon)
    }
    
    fileprivate func iconConstraints() {
        icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        icon.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
        
        //icon.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    }
    
    fileprivate func temperatureConstraints() {
        temperature.topAnchor.constraint(equalTo: time.bottomAnchor, constant: 5.0).isActive = true
        temperature.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 13.0).isActive = true
        
    }
    
    fileprivate func timeConstraints() {
        time.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27.0).isActive = true
        time.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 13.0).isActive = true
        time.heightAnchor.constraint(equalToConstant: 16.0).isActive = true
    }
}
