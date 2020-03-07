//
//  WeekViewModel.swift
//  Rainstorm
//
//  Created by Colin Zhou on 2020-03-05.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import Foundation

struct WeekViewModel {
    
    // MARK: - Properties
    
    let weatherData: [ForecastWeatherConditions]
    
    // MARK: -
    
    var numberOfDays: Int {
        return weatherData.count
    }
    
    // MARK: - Methods
    
    func viewModel(for index: Int) -> WeekDayViewModel {
        return WeekDayViewModel(weatherData: weatherData[index])
    }
    
}
