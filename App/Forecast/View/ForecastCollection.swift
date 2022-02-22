//
//  ForecastCollection.swift
//  WeatherApp
//
//  Created by Eugene on 19.02.2022.
//

import UIKit
import Foundation

struct ForecastCollection {
    let layout: UICollectionViewFlowLayout
    var collectionView: UICollectionView
    
    init(){
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(named: "mainBGLight")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(LocationCollectionViewCell.self, forCellWithReuseIdentifier: LocationCollectionViewCell.identifier)
    }
    
    func getCollectionView() -> UICollectionView {
        return collectionView
    }
}

