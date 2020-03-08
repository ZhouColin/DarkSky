//
//  DayViewModel.swift
//  DarkSky
//
//  Created by Colin Zhou on 2020-03-05.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit

struct DayViewModel {
    
    // MARK: - Properties
    
    let weatherData: CurrentWeatherConditions
    
    private let dateFormatter = DateFormatter()
    
    var date: String {
        // Configure Date Formatter
        dateFormatter.dateFormat = "EEE, MMMM d YYYY"
        
        // Convert Date to String
        return dateFormatter.string(from: weatherData.time)
    }
    
    var time: String {
        // Configure Date Formatter
        dateFormatter.dateFormat = "hh:mm a"
        
        // Convert Date to String
        return dateFormatter.string(from: weatherData.time)
    }

    var summary: String {
        return weatherData.summary
    }

    var temperature: String {
        return String(format: "%.1f °F", weatherData.temperature)
    }
    
    var windSpeed: String {
        return String(format: "%.f MPH", weatherData.windSpeed)
    }
 
    var image: UIImage? {
        return UIImage.imageForIcon(with: weatherData.icon)
    }
    
    var humidity: Double {
        return weatherData.humidity
    }

    var pressure: Double {
        return weatherData.pressure
    }
    
    var uvIndex: Double {
        return weatherData.uvIndex
    }

    var visibility: Double {
        return weatherData.visibility
    }
}
