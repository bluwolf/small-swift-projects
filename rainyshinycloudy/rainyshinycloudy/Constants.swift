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

let CURRENT_WEATHER_URL =  "\(BASE_URL)\(LATITUDE)-34\(LONGITUDE)34\(APP_ID)\(API_KEY)"
