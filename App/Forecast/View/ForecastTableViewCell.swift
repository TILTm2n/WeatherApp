//
//  ForecastTableViewCell.swift
//  WeatherApp
//
//  Created by Eugene on 13.02.2022.
//

import Foundation
import UIKit

class ForecastTableViewCell: UITableViewCell {

    static let identifier = "TableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    let dayOfWeek: UILabel = {
        var dayOfWeek = UILabel()
        dayOfWeek.text = "Sunday"
        dayOfWeek.translatesAutoresizingMaskIntoConstraints = false
        dayOfWeek.font = UIFont(name: "RobotoSlab-Medium", size: 14)
        dayOfWeek.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return dayOfWeek
    }()
    
    let date: UILabel = {
        var date = UILabel()
        date.text = "July,23"
        date.translatesAutoresizingMaskIntoConstraints = false
        date.font = UIFont(name: "RobotoSlab-Light", size: 13)
        date.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return date
    }()
    
    let temperature: UILabel = {
        var temperature = UILabel()
        temperature.text = "28C"
        temperature.translatesAutoresizingMaskIntoConstraints = false
        temperature.font = UIFont(name: "RobotoSlab-Medium", size: 36)
        temperature.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return temperature
    }()
    
    let icon: UIImageView = {
        var icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFill
        icon.image = UIImage(named: "cloudy")
        return icon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(dayOfWeek)
        contentView.addSubview(date)
        contentView.addSubview(temperature)
        contentView.addSubview(icon)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = UIColor(named: "tabBarColorLight")
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        
        setConstraints()
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            dayOfWeek.heightAnchor.constraint(equalToConstant: 18.0),
            dayOfWeek.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24.0),
            dayOfWeek.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 27.0)
        ])
        
        NSLayoutConstraint.activate([
            date.heightAnchor.constraint(equalToConstant: 17.0),
            date.topAnchor.constraint(equalTo: dayOfWeek.bottomAnchor),
            date.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 27.0)
        ])
        
        NSLayoutConstraint.activate([
            temperature.heightAnchor.constraint(equalToConstant: 47.0),
            temperature.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            temperature.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: 80),
            icon.heightAnchor.constraint(equalToConstant: 80),
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -27.0)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
