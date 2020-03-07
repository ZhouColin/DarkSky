//
//  WeekDay.swift
//  DarkSky
//
//  Created by Colin Zhou on 2020-03-06.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit

protocol WeekDay {
    
    var day: String { get }
    var date: String { get }
    var temperature: String { get }
    var image: UIImage? { get }
    
}
