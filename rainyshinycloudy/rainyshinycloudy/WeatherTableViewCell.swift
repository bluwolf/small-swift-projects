//
//  WeatherTableViewCell.swift
//  rainyshinycloudy
//
//  Created by Xiaohan Chen on 11/26/16.
//  Copyright © 2016 Xiaohan Chen. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!

    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    
    func configureCell(forecast : Forecast){
        lowTempLabel.text = "\(forecast.lowTemp)"
        highTempLabel.text = "\(forecast.highTemp)"
        weatherTypeLabel.text = forecast.weatherType
        dayLabel.text = forecast.date
        weatherIconImageView.image = UIImage(named:forecast.weatherType)
    }

 

}
