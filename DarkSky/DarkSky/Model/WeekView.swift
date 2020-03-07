//
//  WeekView.swift
//  DarkSky
//
//  Created by Colin Zhou on 2020-03-06.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

struct WeekView {

    let weatherData: [ForecastWeatherConditions]
    
    var numberOfDays: Int {
        return weatherData.count
    }
    
    func viewModel(for index: Int) -> WeekDayViewModel {
        return WeekDayViewModel(weatherData: weatherData[index])
    }
    
}
