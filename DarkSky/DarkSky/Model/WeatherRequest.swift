//
//  WeatherRequest.swift
//  DarkSky
//
//  Created by Colin Zhou on 2020-03-06.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//
import Foundation

struct WeatherRequest {

    
    let baseUrl: URL
    
    let location: Location
    
    var latitude: Double {
        return location.latitude
    }
    
    var longitude: Double {
        return location.longitude
    }
    
    var url: URL {
        return baseUrl.appendingPathComponent("\(latitude),\(longitude)")
    }
    
}
