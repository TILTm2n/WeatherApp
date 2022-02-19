//
//  Search.swift
//  WeatherApp
//
//  Created by Eugene on 19.02.2022.
//

import Foundation
import UIKit

struct Search {
    
    var searchContainer: UIView = {
        var searchContainer = UIView()
        searchContainer.clipsToBounds = true
        searchContainer.layer.cornerRadius = 20
        searchContainer.translatesAutoresizingMaskIntoConstraints = false
        return searchContainer
    }()
    
    var searchBar: UIView = {
        var searchBar = UIView()
        searchBar.clipsToBounds = true
        searchBar.layer.cornerRadius = 20
        searchBar.backgroundColor = UIColor(named: "tabBarColorLight")
        return searchBar
    }()
    
    var searchTextField: UISearchTextField = {
        var searchTextField = UISearchTextField()
        searchTextField.placeholder = "Search"
        return searchTextField
    }()
    
    var searchButton: UIButton = {
        var searchButton = UIButton()
        searchButton.layer.cornerRadius = 20
        searchButton.frame = CGRect(x: 0, y: 0, width: 50, height: 63)
        searchButton.backgroundColor = UIColor(named: "tabBarColorLight")
        searchButton.setImage(UIImage(named: "locationButton"), for: .normal)
        return searchButton
    }()
    
    init() {
        searchBar.addSubview(searchTextField)
        searchContainer.addSubview(searchBar)
        searchContainer.addSubview(searchButton)
        
        searchBarConstraints()
        searchButtonConstraints()
        searchTextFieldConstraints()
    }
    
    func searchButtonConstraints() {
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchButton.widthAnchor.constraint(equalToConstant: 50),
            searchButton.heightAnchor.constraint(equalToConstant: 63),
            searchButton.rightAnchor.constraint(equalTo: searchContainer.rightAnchor),
            searchButton.centerYAnchor.constraint(equalTo: searchContainer.centerYAnchor)
        ])
    }
    
    func searchBarConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.heightAnchor.constraint(equalToConstant: 63),
            searchBar.topAnchor.constraint(equalTo: searchContainer.topAnchor),
            searchBar.leftAnchor.constraint(equalTo: searchContainer.leftAnchor),
            searchBar.bottomAnchor.constraint(equalTo: searchContainer.bottomAnchor),
            searchBar.rightAnchor.constraint(equalTo: searchButton.leftAnchor, constant: -15)
        ])
    }
    
    func searchTextFieldConstraints() {
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: searchBar.topAnchor),
            searchTextField.leftAnchor.constraint(equalTo: searchBar.leftAnchor),
            searchTextField.rightAnchor.constraint(equalTo: searchBar.rightAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: searchBar.bottomAnchor)
        ])
    }
    
}
