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
    
    let dataStack: UIStackView = {
        var dataStack = UIStackView(frame: CGRect(x: 50, y: 300, width: 60, height: 35))
        dataStack.axis = .vertical
        dataStack.translatesAutoresizingMaskIntoConstraints = false
        return dataStack
    }()
    
    let dayOfWeek: UILabel = {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "EEEE"
        let dayOfTheWeekString = dateFormatter.string(from: date)
        
        var myLabel = UILabel()
        myLabel.font = .systemFont(ofSize: 14, weight: .bold)
        myLabel.textColor = .white
        myLabel.text = "\(dayOfTheWeekString)"
        return myLabel
    }()
    
    let date: UILabel = {
        var month = UILabel()
        month.text = "Month 00"
        month.textColor = .white
        month.font = .systemFont(ofSize: 13, weight: .light)
        return month
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(dataStack)
        contentView.addSubview(temperature)
        contentView.addSubview(icon)
    
        dataStack.addArrangedSubview(dayOfWeek)
        dataStack.addArrangedSubview(date)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = UIColor(named: "tabBarColorLight")
        
        setConstraints()
    }
    
    func setConstraints(){
        
        NSLayoutConstraint.activate([
            dataStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dataStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 28)
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
            icon.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -28.0)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
