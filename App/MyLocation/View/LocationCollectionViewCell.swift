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
        temperature.text = "28C"
        temperature.textColor = .black
        temperature.font = UIFont(name: "RobotoSlab-Medium", size: 17)
        temperature.translatesAutoresizingMaskIntoConstraints = false
        return temperature
    }()
    
    let time: UILabel = {
        var time = UILabel()
        time.text = "00:00am"
        time.textColor = .black
        time.translatesAutoresizingMaskIntoConstraints = false
        time.font = UIFont(name: "RobotoSlab-Medium", size: 12)
        return time
    }()
    
    let icon: UIImageView = {
        var icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        icon.image = UIImage(named: "cloudy")
        icon.translatesAutoresizingMaskIntoConstraints = false
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
    
    func setIcon(icon: String) {
        self.icon.image = UIImage(named: icon)
    }
    
    func setTime(time: String) {
        self.time.text = time
    }
    
    fileprivate func iconConstraints() {
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: 70.0),
            icon.heightAnchor.constraint(equalToConstant: 70.0),
            icon.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    fileprivate func temperatureConstraints() {
        temperature.topAnchor.constraint(equalTo: time.bottomAnchor, constant: 5.0).isActive = true
        temperature.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 13.0).isActive = true
    }
    
    fileprivate func timeConstraints() {
        NSLayoutConstraint.activate([
            time.heightAnchor.constraint(equalToConstant: 16.0),
            time.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 13.0),
            time.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27.0)
        ])
    }
}
