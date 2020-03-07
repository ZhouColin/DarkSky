//
//  AppDelegate.swift
//  DarkSky
//
//  Created by Colin Zhou on 2020-03-05.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit

protocol WeekDayRepresentable {
    
    var day: String { get }
    var date: String { get }
    var temperature: String { get }
    var windSpeed: String { get }
    var image: UIImage? { get }
    
}
