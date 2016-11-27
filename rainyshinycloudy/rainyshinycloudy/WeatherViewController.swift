//
//  WeatherViewController.swift
//  rainyshinycloudy
//
//  Created by Xiaohan Chen on 11/24/16.
//  Copyright © 2016 Xiaohan Chen. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentIconImage: UIImageView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather : CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        
        currentWeather.downloadWeatherDetails {
            //setup ui to load download data
            self.downloadForecastData{
                self.updateUIUpperPanel()
            }
            
        }

 
    }
    
    func downloadForecastData(complete: @escaping DownloadComplete){
        //downloading forecast weather data for TableView
        let forecastURL = URL(string: FORECAST_URL)!
        Alamofire.request(forecastURL).responseJSON{ response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let list = dict["list"] as? [Dictionary<String, AnyObject>]{
                    for obj in list{
                        let forecast  = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
//                        print(obj)
                    }
                    self.tableView.reloadData()
                }
            }
            
            complete()
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherTableViewCell{
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        }else{
            // in case crash
            return WeatherTableViewCell()
        }
        
    }
    func updateUIUpperPanel(){
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        currentIconImage.image = UIImage(named: currentWeather.weatherType) // string is name of file
    }
    
    


}

