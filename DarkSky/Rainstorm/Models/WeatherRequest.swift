//
//  WeatherRequest.swift
//  Rainstorm
//
//  Created by Colin Zhou on 2020-03-05.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import Foundation

struct WeatherRequest {
    
    // MARK: - Properties
    
    let baseUrl: URL
    
    // MARK: -
    
    let location: Location
    
    // MARK: -
    
    var latitude: Double {
        return location.latitude
    }
    
    var longitude: Double {
        return location.longitude
    }
    
    // MARK: -
    
    var url: URL {
        return baseUrl.appendingPathComponent("\(latitude),\(longitude)")
    }
    
}
