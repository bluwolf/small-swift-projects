//
//  Location.swift
//  rainyshinycloudy
//
//  Created by Xiaohan Chen on 11/26/16.
//  Copyright © 2016 Xiaohan Chen. All rights reserved.
//

import CoreLocation

class Location{
    static var sharedInstance = Location()
    
    private init(){
        
    }
    
    var latitude : Double!
    var longitude : Double!
    
}
