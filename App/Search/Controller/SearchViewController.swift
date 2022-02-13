//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by Eugene on 13.02.2022.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {

    let titleStack = UIStackView()
    let searchPanel = UIView()
    let header = UILabel()
    let detail = UILabel()
    let searchBar = UISearchBar()
    let searchTextField = UISearchTextField()
    let searchBarContainer = UIView()
    let locationButton = UIButton()
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainBGLight")
        self.view.addSubview(titleStack)
        self.view.addSubview(searchPanel)
        self.searchPanel.addSubview(searchBarContainer)
        self.searchPanel.addSubview(locationButton)
        self.searchBarContainer.addSubview(searchTextField)
        
        setStackView()
        setStackViewConstraits()
        
        titleStack.addArrangedSubview(header)
        titleStack.addArrangedSubview(detail)
        
        setHeader()
        setDetail()
        
        setSearch()
        setSearchConstraints()
        
        setLocationButton()
        setLocationButtonConstraints()
        
        setSearchBarContainer()
        setSearchBarContainerConstraints()
        
        setSearchBarTextField()
        setSearchBarTextFieldConstraints()
        
        setCollectionView()
        setCollectionViewConstraints()
        
    }
    
    // MARK: - Header and description
    func setStackView(){
        titleStack.axis = .vertical
        titleStack.spacing = 3.0
        titleStack.alignment = .center
    }
    
    func setStackViewConstraits(){
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        titleStack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 45).isActive = true
        titleStack.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -55).isActive = true
        titleStack.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 55).isActive = true
        titleStack.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setHeader(){
        header.text = "Pick a location"
        header.layer.shadowOffset = CGSize(width: 5, height: 5)
        header.layer.shadowOpacity = 0.5
        header.shadowColor = .black
        header.font = UIFont.boldSystemFont(ofSize: 30.0)
        header.textAlignment = .center
        header.textColor = .white
        header.translatesAutoresizingMaskIntoConstraints = false
        header.widthAnchor.constraint(equalTo: self.titleStack.widthAnchor).isActive = true
    }
    
    func setDetail(){
        detail.text = "Type the area or city you want to know the detailed weather information at this time."
        detail.layer.shadowOffset = CGSize(width: 5, height: 5)
        detail.layer.shadowOpacity = 0.5
        detail.font = UIFont.systemFont(ofSize: 15.0, weight: .light)
        detail.textAlignment = .center
        detail.textColor = .white
        detail.translatesAutoresizingMaskIntoConstraints = false
        detail.widthAnchor.constraint(equalTo: self.titleStack.widthAnchor).isActive = true
        detail.lineBreakMode = .byWordWrapping
        detail.numberOfLines = 3
        detail.baselineAdjustment = .alignCenters
        
    }
    
    // MARK: - searchPanel
    func setSearch(){
        searchPanel.layer.cornerRadius = 20
    }
    
    func setSearchConstraints(){
        searchPanel.translatesAutoresizingMaskIntoConstraints = false
        searchPanel.topAnchor.constraint(equalTo: self.titleStack.bottomAnchor, constant: 21).isActive = true
        searchPanel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 45).isActive = true
        searchPanel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -45).isActive = true
        searchPanel.heightAnchor.constraint(equalToConstant: 63.0).isActive = true
    }
    
    func setLocationButton(){
        locationButton.backgroundColor = UIColor(named: "tabBarColorLight")
        locationButton.layer.cornerRadius = 20
        locationButton.setImage(UIImage(named: "locationButton"), for: .normal)
    }
    
    func setLocationButtonConstraints(){
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.rightAnchor.constraint(equalTo: self.searchPanel.rightAnchor).isActive = true
        locationButton.centerYAnchor.constraint(equalTo: self.searchPanel.centerYAnchor).isActive = true
        locationButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        locationButton.heightAnchor.constraint(equalTo: self.searchPanel.heightAnchor).isActive = true
    }
    
    func setSearchBarContainer(){
        searchBarContainer.clipsToBounds = true
        searchBarContainer.backgroundColor = UIColor(named: "tabBarColorLight")
        searchBarContainer.layer.cornerRadius = 20
    }
    
    func setSearchBarContainerConstraints(){
        searchBarContainer.translatesAutoresizingMaskIntoConstraints = false
        searchBarContainer.rightAnchor.constraint(equalTo: self.locationButton.leftAnchor, constant: -15).isActive = true
        searchBarContainer.leftAnchor.constraint(equalTo: self.searchPanel.leftAnchor).isActive = true
        searchBarContainer.topAnchor.constraint(equalTo: self.searchPanel.topAnchor).isActive = true
        searchBarContainer.bottomAnchor.constraint(equalTo: self.searchPanel.bottomAnchor).isActive = true
    }
    
    func setSearchBarTextField(){
        searchTextField.placeholder = "Search"
    }

    func setSearchBarTextFieldConstraints(){
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.leftAnchor.constraint(equalTo: searchBarContainer.leftAnchor).isActive = true
        searchTextField.rightAnchor.constraint(equalTo: searchBarContainer.rightAnchor).isActive = true
        searchTextField.topAnchor.constraint(equalTo: searchBarContainer.topAnchor).isActive = true
        searchTextField.bottomAnchor.constraint(equalTo: searchBarContainer.bottomAnchor).isActive = true
    }
    
    func setCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {return}
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        //Регистрирует класс для использования при создании новых ячеек представления коллекции.
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.backgroundColor = UIColor(named: "mainBGLight")
        collectionView.showsVerticalScrollIndicator = false
    }
    
    func setCollectionViewConstraints(){
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.topAnchor.constraint(equalTo: self.searchPanel.bottomAnchor, constant: 31.0).isActive = true
        collectionView?.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 45.0).isActive = true
        collectionView?.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -45.0).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0).isActive = true
    }
    
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //collectionView.deselectItem(at: indexPath, animated: true)
        collectionView.cellForItem(at: indexPath)?.contentView.backgroundColor = UIColor(named: "tabBarColorLight")
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.contentView.backgroundColor = .white
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 145.0, height: 200.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 39
    }
}
