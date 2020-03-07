//
//  UIImage.swift
//  DarkSky
//
//  Created by Colin Zhou on 2020-03-06.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func imageForIcon(with name: String) -> UIImage? {
        switch name {
        case "clear-day",
             "clear-night",
             "fog",
             "rain",
             "snow",
             "sleet",
             "wind":
            return UIImage(named: name)
        case "cloudy",
             "partly-cloudy-day",
             "partly-cloudy-night":
            return UIImage(named: "cloudy")
        default:
            return UIImage(named: "clear-day")
        }
    }
    
}
