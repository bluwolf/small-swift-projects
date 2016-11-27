//
//  CurrentWeather.swift
//  rainyshinycloudy
//
//  Created by Xiaohan Chen on 11/26/16.
//  Copyright © 2016 Xiaohan Chen. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather{
    private var _cityName : String!
    private var _date : String!
    private var _weatherType : String!
    private var _currentTemp : Double!
    
    var cityName : String{
        if _cityName == nil{
            _cityName = ""
        }
        return _cityName
    }
    
    var date :String {
        if _date == nil{
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var weatherType : String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp : Double{
        if _currentTemp == nil{
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    


    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        
        let currentWeatheURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatheURL).responseJSON{ response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject>{
                
                if let name = dict["name"] as? String{
                    self._cityName = name.capitalized
                    print("printing city name in actual function: \(self._cityName)")
                    
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]{
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main.capitalized
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject>{
                    if let currentTemperature = main["temp"] as? Double{
                        let kelvinToFarenheitPreDivision = (currentTemperature * 9/5 - 459.67)
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                        
                        self._currentTemp = kelvinToFarenheit
                        
                    }
                    
                }
            }
            
           
            completed()
        }
        
        
    }

}
