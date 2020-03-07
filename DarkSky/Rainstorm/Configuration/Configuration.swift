//
//  Configuration.swift
//  Rainstorm
//
//  Created by Colin Zhou on 2020-03-05.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import Foundation

enum Defaults {
    
    static let location = Location(latitude: 37.335114, longitude: -122.008928)
    
}

enum Configuration {
    
    static var refreshThreshold: TimeInterval {
        #if DEBUG
        return 60.0
        #else
        return 10.0 * 60.0
        #endif
    }
    
}

enum WeatherService {
    
    private static let apiKey = "c0fda1f5e8fdb50ef7757a854a395316"
    private static let baseUrl = URL(string: "https://api.darksky.net/forecast/")!
    
    static var authenticatedBaseUrl: URL {
        return baseUrl.appendingPathComponent(apiKey)
    }
    
}
