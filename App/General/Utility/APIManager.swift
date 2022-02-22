//
//  APIManager.swift
//  WeatherApp
//
//  Created by Eugene on 13.02.2022.
//

import Foundation

struct Coordinates {
    private var latitude: Double
    private var longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var Latitude: Double {
        get {
            return latitude
        }
        set(newLatitude) {
            latitude = newLatitude
        }
    }
    
    var Longitude: Double {
        get {
            return latitude
        }
        set(newLongitude) {
            longitude = newLongitude
        }
    }
}

protocol FinalURLPoint {
    var baseURL: URL { get }
    var path: String { get }
    var request: URLRequest { get }
}

enum APIResult<LocationModel> {
    case Success(LocationModel)
    case Failure(Error)
}

protocol APIManager {
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    //получает данные
    func JSONTaskWith(request: URLRequest, completionHandler: @escaping (LocationModel?, HTTPURLResponse?, Error?) -> Void) -> URLSessionDataTask
    
    //использует данные для обновленя интерфейса
    func fetch<LocationModel>(request: URLRequest, completionHandler: @escaping (APIResult<LocationModel>) -> Void)
}

extension APIManager {
    func JSONTaskWith(request: URLRequest, completionHandler: @escaping (LocationModel?, HTTPURLResponse?, Error?) -> Void) -> URLSessionDataTask{
        
        let decoder = JSONDecoder()
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            //проверяем наличие HTTPURLResponse
            guard let HTTPResponse = response as? HTTPURLResponse else {
                
                let userInfo = [NSLocalizedDescriptionKey: NSLocalizedString("Missing HTTP Response", comment: "")]
                let error = NSError(domain: NetworkingErrorDomain, code: MissingHTTPResponseError, userInfo: userInfo)
                
                //если нет, то возвращаем в completionHandler данные
                completionHandler(nil, nil, error)
                return
            }
            
            //проверяем пустые ли данные
            if data == nil{
                if let error = error{
                    
                    //если да и есть ошибка, то возвращаем в completionHandler данные
                    completionHandler(nil, HTTPResponse, error)
                }
            }else{
                switch HTTPResponse.statusCode{
                case 200:
                    do{
                        //сериализуем данные из json формата в объект Foundation
                        let weatherData = try decoder.decode(LocationModel.self, from: data!)
                        completionHandler(weatherData, HTTPResponse, nil)
                    }catch let error as NSError{
                        completionHandler(nil, HTTPResponse, error)
                    }
                default:
                    print("We have got response status \(HTTPResponse.statusCode) pososi")
                }
            }
        }
        return dataTask
    }
    
    func fetch<LocationModel>(request: URLRequest, completionHandler: @escaping (APIResult<LocationModel>) -> Void){
        
        let dataTask = JSONTaskWith(request: request) { weatherData, response, error in
            guard let weatherData = weatherData else{
                if let error = error {
                    completionHandler(.Failure(error))
                }
                return
            }
            
            if let weatherData = weatherData as? LocationModel {
                completionHandler(.Success(weatherData))
            }
        }
        
        dataTask.resume()
    }
}
