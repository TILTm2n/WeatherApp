//
//  Title.swift
//  WeatherApp
//
//  Created by Eugene on 19.02.2022.
//

import Foundation
import UIKit

struct Header {
    private var header = UIView()
    private var titleLabel = UILabel()
    private var dayLabel = UILabel()
    private var dateLabel = UILabel()
    
    init() {
        header.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textAlignment = .center
        titleLabel.text = "Forecast Report"
        titleLabel.layer.shadowOpacity = 0.5
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        titleLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        dayLabel.text = "Today"
        dayLabel.textColor = .white
        dayLabel.font = UIFont(name: "RobotoSlab-Light", size: 15)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.text = "Jan 30,2022"
        dateLabel.textColor = .white
        dateLabel.textAlignment = .right
        dateLabel.font = UIFont(name: "RobotoSlab-Light", size: 15)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        header.addSubview(dayLabel)
        header.addSubview(dateLabel)
        header.addSubview(titleLabel)
        
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: header.topAnchor),
            dayLabel.leftAnchor.constraint(equalTo: header.leftAnchor),
            dayLabel.bottomAnchor.constraint(equalTo: header.bottomAnchor),
            dayLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            dateLabel.rightAnchor.constraint(equalTo: header.rightAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: header.bottomAnchor),
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30)
        ])
    }
    
    func getHeader() -> UIView {
        return header
    }
    
    func getTitle() -> UILabel {
        return titleLabel
    }
    
    func getDay() -> UILabel {
        return dayLabel
    }
    
    func getDate() -> UILabel {
        return dateLabel
    }
    
    func setForecastDate(_ date: Double) {
        let date = Date(timeIntervalSince1970: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "en_US")
        let strDate = dateFormatter.string(from: date)
        self.dateLabel.text = strDate
    }
}
