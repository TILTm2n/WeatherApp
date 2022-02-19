//
//  Collection.swift
//  WeatherApp
//
//  Created by Eugene on 19.02.2022.
//

import UIKit
import Foundation

struct SearchCollection {
    let layout: UICollectionViewFlowLayout
    var collectionView: UICollectionView
    
    init(){
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor(named: "mainBGLight")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
    }
}
