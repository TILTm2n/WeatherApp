//
//  ForecastTable.swift
//  WeatherApp
//
//  Created by Eugene on 19.02.2022.
//
import UIKit
import Foundation

class ForecastTable {
    var tableView: UITableView
    
    init() {
        tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor(named: "mainBGLight")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: ForecastTableViewCell.identifier)
    }
}
