//
//  LocationManager.swift
//  Rainstorm
//
//  Created by Colin Zhou on 2020-03-05.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, LocationService {
    
    // MARK: - Properties
    
    private var didFetchLocation: FetchLocationCompletion?

    // MARK: -
    
    private lazy var locationManager: CLLocationManager = {
        // Initialize Location Manager
        let locationManager = CLLocationManager()
        
        // Configure Location Manager
        locationManager.delegate = self
        
        return locationManager
    }()
    
    func fetchLocation(completion: @escaping LocationService.FetchLocationCompletion) {
        // Store Reference to Completion
        self.didFetchLocation = completion
        
        // Fetch Location
        locationManager.requestLocation()
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .notDetermined {
            // Request Authorization
            locationManager.requestWhenInUseAuthorization()
            
        } else if status == .authorizedWhenInUse {
            // Fetch Location
            locationManager.requestLocation()
            
        } else {
            // Location Service Result
            let result: LocationServiceResult = .failure(.notAuthorizedToRequestLocation)
            
            // Invoke Completion Handler
            didFetchLocation?(result)
            
            // Reset Completion Handler
            didFetchLocation = nil
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        // Location Service Result
        let result: LocationServiceResult = .success(Location(location: location))
        
        // Invoke Completion Handler
        didFetchLocation?(result)
        
        // Reset Completion Handler
        didFetchLocation = nil
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to Fetch Location (\(error))")
    }
    
}

fileprivate extension Location {
    
    // MARK: - Initialization
    
    init(location: CLLocation) {
        latitude = location.coordinate.latitude
        longitude = location.coordinate.longitude
    }
    
}
