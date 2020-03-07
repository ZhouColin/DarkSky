//
//  WeekDayView.swift
//  DarkSky
//
//  Created by Colin Zhou on 2020-03-06.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//


import UIKit

struct WeekDayViewModel {
    
    let weatherData: ForecastWeatherConditions

    private let dateFormatter = DateFormatter()
    
    var day: String {
        // Configure Date Formatter
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.string(from: weatherData.time)
    }
    
    var date: String {
        // Configure Date Formatter
        dateFormatter.dateFormat = "MMMM d"
        
        return dateFormatter.string(from: weatherData.time)
    }
    
    var temperature: String {
        let min = String(format: "%.1f °F", weatherData.temperatureMin)
        let max = String(format: "%.1f °F", weatherData.temperatureMax)
        
        return "\(min) - \(max)"
    }
    
    var windSpeed: String {
        return String(format: "%.f MPH", weatherData.windSpeed)
    }
    
    var image: UIImage? {
        return UIImage.imageForIcon(with: weatherData.icon)
    }

}

extension WeekDayViewModel: WeekDay {
    
}
