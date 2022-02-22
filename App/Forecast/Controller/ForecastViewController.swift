//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by Eugene on 13.02.2022.
//

import CoreLocation
import Foundation
import UIKit

class ForecastViewController: UIViewController, CLLocationManagerDelegate {

    let header = Header().getHeader()
    let collectionView = ForecastCollection().getCollectionView()
    let tableView = ForecastTable().getTableView()
    let locationManager = CLLocationManager()
    
    lazy var refreshControl : UIRefreshControl = {
        var refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.red
        return refreshControl
    }()
    
    lazy var weatherManager = APIWeatherManager(apiKey: "5c3cbd6a194ea55903526944cac7ebe1")
    var coordanates = Coordinates(latitude: 44.676281998542265, longitude: 34.40885457364702)
    var hourlyForecastArray: [HourForecast] = []
    //var dailyForecastArray: [DaysForecast] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainBGLight")
        view.addSubview(header)
        view.addSubview(collectionView)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        setHeaderConstraints()
        setTableViewConstraints()
        setCollectionViewConstraints()
        
    }
    
    func getCurrentWeatherData() {
        weatherManager.fetchCurrentWeatherWith(coordinates: coordanates) { (result) in
            //self.toggleActivityIndicator(on: false)
            switch result {
            case .Success(let currentWeather):
                self.updateUIWith(currentWeather)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    self.tableView.reloadData()
                }
            case.Failure(let error as NSError):
                let alertController = UIAlertController(title: "Unable to get data", message: "\(error.localizedDescription)", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(ok)
                self.present(alertController, animated: true, completion: nil)
            default: break
            }
        }
    }
    
    func updateUIWith(_ currentWeather: LocationModel) {
        for i in 0...6 {
            hourlyForecastArray.append(currentWeather.hours[i])
            //dailyForecastArray.append(currentWeather.days[i])
        }
    }
    
    //MARK: - Header Constraints
    func setHeaderConstraints() {
        NSLayoutConstraint.activate([
            header.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45.0),
            header.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 28),
            header.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -28)
        ])
    }
    
    //MARK: - Collection Constraints
    func setCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 85),
            collectionView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0.0)
        ])
    }
    
    //MARK: - Table Constraints
    func setTableViewConstraints(){
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 23.0),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30.0),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30.0)
        ])
    }
}

// MARK: - Table View
extension ForecastViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.identifier) as! ForecastTableViewCell
        cell.backgroundColor = UIColor(named: "mainBGLight")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}


// MARK: - Collection View
extension ForecastViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 166.0, height: 85.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 29, bottom: 0, right: 29)
    }
    
}
