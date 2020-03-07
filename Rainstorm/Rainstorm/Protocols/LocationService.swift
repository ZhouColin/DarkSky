//
//  LocationService.swift
//  Rainstorm
//
//  Created by Colin Zhou on 2020-03-05.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import Foundation

enum LocationServiceError: Error {
    case notAuthorizedToRequestLocation
}

enum LocationServiceResult {
    case success(Location)
    case failure(LocationServiceError)
}

protocol LocationService {
    
    // MARK: - Type Aliases
    
    typealias FetchLocationCompletion = (LocationServiceResult) -> Void
    
    // MARK: - Methods
    
    func fetchLocation(completion: @escaping FetchLocationCompletion)
    
}
