//
//  DescriptionHeader.swift
//  WeatherApp
//
//  Created by Eugene on 19.02.2022.
//

import Foundation
import UIKit

struct DescriptionHeader {
    
    var headerStackView: UIStackView = {
        var headerStackView = UIStackView()
        headerStackView.spacing = 5
        headerStackView.axis = .vertical
        headerStackView.alignment = .center
        headerStackView.distribution = .fillEqually
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        return headerStackView
    }()
    
    var header: UILabel = {
        var header = UILabel()
        header.textColor = .white
        header.shadowColor = .black
        header.textAlignment = .center
        header.text = "Pick a location"
        header.layer.shadowOpacity = 0.5
        header.font = UIFont.boldSystemFont(ofSize: 30.0)
        header.layer.shadowOffset = CGSize(width: 5, height: 5)
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    var detail: UILabel = {
        let detail = UILabel()
        detail.numberOfLines = 3
        detail.textColor = .white
        detail.textAlignment = .center
        detail.layer.shadowOpacity = 0.5
        detail.lineBreakMode = .byWordWrapping
        detail.baselineAdjustment = .alignCenters
        detail.layer.shadowOffset = CGSize(width: 5, height: 5)
        detail.translatesAutoresizingMaskIntoConstraints = false
        detail.font = UIFont.systemFont(ofSize: 15.0, weight: .light)
        detail.text = "Type the area or city you want to know the detailed weather information at this time."
        return detail
    }()
    
    init() {
        headerStackView.addArrangedSubview(header)
        headerStackView.addArrangedSubview(detail)
        layoutSubviews()
    }
    
    func layoutSubviews() {
        header.widthAnchor.constraint(equalTo: headerStackView.widthAnchor).isActive = true
        detail.widthAnchor.constraint(equalTo: headerStackView.widthAnchor).isActive = true
    }
}
