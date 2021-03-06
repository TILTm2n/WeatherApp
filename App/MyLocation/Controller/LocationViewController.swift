//
//  LocationViewController.swift
//  WeatherApp
//
//  Created by Eugene on 13.02.2022.
//

import CoreLocation
import Foundation
import UIKit

class LocationViewController: UIViewController, CLLocationManagerDelegate {
    
    let icon            = Icon(iconName: "rain")
    let dateLabel       = DateLabel(text: "date")
    let todayLabel      = Today().label
    let temperature     = Temperature(temp: 0)
    var collectionView  = CustomCollection().collectionView
    let customStackView = CustomStackView()
    lazy var scrollView = CustomScrollView(frame: self.view.frame).scrollView
    lazy var location   = LocationLabel()
    let locationManager = CLLocationManager()
    
    lazy var refreshControl : UIRefreshControl = {
        var refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.red
        return refreshControl
    }()
    
    lazy var weatherManager = APIWeatherManager(apiKey: "5c3cbd6a194ea55903526944cac7ebe1")
    var coordanates = Coordinates(latitude: 44.676281998542265, longitude: 34.40885457364702)
    var hourlyForecastArray: [HourForecast] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extendedLayoutIncludesOpaqueBars = true
        self.view.backgroundColor = UIColor(named: "mainBGLight")
        view.addSubview(scrollView)
        scrollView.addSubview(icon.iconImage)
        scrollView.addSubview(dateLabel.label)
        scrollView.addSubview(todayLabel)
        scrollView.addSubview(temperature.label)
        scrollView.addSubview(location.locationLabel)
        scrollView.addSubview(collectionView)
        scrollView.addSubview(customStackView.stackView)
        scrollView.refreshControl = refreshControl
        collectionView.delegate = self
        collectionView.dataSource = self
        refreshControl.addTarget(self, action: #selector(reloadAllDataByRefresh), for: .primaryActionTriggered)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        setConstraints()
        getCurrentWeatherData()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last! as CLLocation
        coordanates.Latitude = userLocation.coordinate.latitude
        coordanates.Longitude = userLocation.coordinate.longitude
    }
    
    func toggleActivityIndicator(on: Bool) {
        DispatchQueue.main.async {
            self.refreshControl.isHidden = on
            if on {
                self.refreshControl.beginRefreshing()
            } else {
                self.refreshControl.endRefreshing()
            }
        }
        
    }
    
    @objc func reloadAllDataByRefresh() {
        toggleActivityIndicator(on: true)
        getCurrentWeatherData()
    }
    
    func getCurrentWeatherData() {
        weatherManager.fetchCurrentWeatherWith(coordinates: coordanates) { (result) in
            self.toggleActivityIndicator(on: false)
            switch result {
            case .Success(let currentWeather):
                self.updateUIWith(currentWeather)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
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
        self.location.changeLocation(location: currentWeather.location)
        self.location.changeLocation(location: currentWeather.location)
        self.temperature.setTemperature(temperature: Int(currentWeather.current.temperature))
        self.customStackView.changeValues(temp: Int(currentWeather.current.feeling), humidity: Int(currentWeather.current.humidity), speed: Int(currentWeather.current.wind))
        self.dateLabel.setDate(currentWeather.current.getStringDate())
        self.icon.setImage(image: WeatherIconManager(rawValue: currentWeather.current.weather[0].icon).rawValue)
        
        for i in 0...6 {
            hourlyForecastArray.append(currentWeather.hours[i])
        }
    }
    
    func setConstraints(){
        //MARK: - Scroll View Constraints
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        //MARK: - Location Label Constraints
        NSLayoutConstraint.activate([
            location.locationLabel.heightAnchor.constraint(equalToConstant: 40.0),
            location.locationLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            location.locationLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45.0)
        ])
        
        //MARK: - Date label Constraints
        NSLayoutConstraint.activate([
            dateLabel.label.heightAnchor.constraint(equalToConstant: 20.0),
            dateLabel.label.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            dateLabel.label.topAnchor.constraint(equalTo: location.locationLabel.bottomAnchor, constant: 5)
        ])
        
        //MARK: - Icon Constaints
        NSLayoutConstraint.activate([
            icon.iconImage.widthAnchor.constraint(equalToConstant: 155.0),
            icon.iconImage.heightAnchor.constraint(equalToConstant: 155.0),
            icon.iconImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            icon.iconImage.topAnchor.constraint(equalTo: dateLabel.label.bottomAnchor, constant: 24.0)
        ])
        
        //MARK: - Temperature Constraints
        NSLayoutConstraint.activate([
            temperature.label.heightAnchor.constraint(equalToConstant: 92),
            temperature.label.topAnchor.constraint(equalTo: icon.iconImage.bottomAnchor),
            temperature.label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // MARK: - Custom StackView
        NSLayoutConstraint.activate([
            customStackView.stackView.heightAnchor.constraint(equalToConstant: 46.0),
            customStackView.stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            customStackView.stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            customStackView.stackView.topAnchor.constraint(equalTo: icon.iconImage.bottomAnchor, constant: 100.0)
        ])
        
        // MARK: - Today Label Constraints
        NSLayoutConstraint.activate([
            todayLabel.heightAnchor.constraint(equalToConstant: 26),
            todayLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 24.0),
            todayLabel.topAnchor.constraint(equalTo: customStackView.stackView.bottomAnchor, constant: 31.0)
        ])
        
        // MARK: - Collection View Constraints
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 85),
            collectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            collectionView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 15)
        ])
    }
}

extension LocationViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyForecastArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationCollectionViewCell.identifier, for: indexPath) as! LocationCollectionViewCell
        cell.setTemperature(temp: hourlyForecastArray[indexPath.row].temperature)
        cell.setIcon(icon: hourlyForecastArray[indexPath.row].weather[0].icon)
        cell.setTime(time: hourlyForecastArray[indexPath.row].getStringDate())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 166.0, height: 85.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
}
