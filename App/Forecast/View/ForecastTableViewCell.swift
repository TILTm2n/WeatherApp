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
        temperature.translatesAutoresizingMaskIntoConstraints = false
        temperature.text = "28C"
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
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = UIColor(named: "tabBarColorLight")
        
        setDayOfWeekConstraints()
        setDateConstraints()
        setTemperatureConstraints()
        setIconConstraints()
    }
    
    func setDayOfWeekConstraints(){
        dayOfWeek.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24.0).isActive = true
        dayOfWeek.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 27.0).isActive = true
        dayOfWeek.heightAnchor.constraint(equalToConstant: 18.0).isActive = true
    }
    
    func setDateConstraints(){
        date.topAnchor.constraint(equalTo: dayOfWeek.bottomAnchor).isActive = true
        date.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 27.0).isActive = true
        date.heightAnchor.constraint(equalToConstant: 17.0).isActive = true
    }
    
    func setTemperatureConstraints(){
        temperature.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        temperature.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        temperature.heightAnchor.constraint(equalToConstant: 47.0).isActive = true
    }
    
    func setIconConstraints(){
        icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 80).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 80).isActive = true
        icon.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -27.0).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
