//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Xiaohan Chen on 11/26/16.
//  Copyright © 2016 Xiaohan Chen. All rights reserved.
//

import Foundation


let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE =  "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "41b937e7291d894ef104ac723bd9d1e7"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL =  "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=-36&lon=123&cnt=10&mode=json&appid=41b937e7291d894ef104ac723bd9d1e7"
