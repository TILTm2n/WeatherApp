//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by Eugene on 13.02.2022.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    let searchPanel = Search().searchContainer
    let header = DescriptionHeader().headerStackView
    var collection = SearchCollection().collectionView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainBGLight")
        self.view.addSubview(header)
        self.view.addSubview(searchPanel)
        self.view.addSubview(collection)
        collection.delegate = self
        collection.dataSource = self
        
        setHeaderConstraits()
        setSearchConstraints()
        setCollectionViewConstraints()
    }

    // MARK: - Header
    func setHeaderConstraits(){
        NSLayoutConstraint.activate([
            header.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -55),
            header.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 45),
            header.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 55)
        ])
    }
    
    // MARK: - Search Panel
    func setSearchConstraints(){
        searchPanel.translatesAutoresizingMaskIntoConstraints = false
        searchPanel.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 21).isActive = true
        searchPanel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 45).isActive = true
        searchPanel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -45).isActive = true
        searchPanel.heightAnchor.constraint(equalToConstant: 63.0).isActive = true
    }
    
    // MARK: - Search Collection
    func setCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: searchPanel.bottomAnchor, constant: 31.0),
            collection.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 45.0),
            collection.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -45.0),
            collection.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0)
        ])
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
        return 10
    }
}
