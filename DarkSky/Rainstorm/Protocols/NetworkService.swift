//
//  NetworkService.swift
//  Rainstorm
//
//  Created by Colin Zhou on 2020-03-05.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import Foundation

protocol NetworkService {
    
    // MARK: - Type Aliases
    
    typealias FetchDataCompletion = (Data?, URLResponse?, Error?) -> Void
    
    // MARK: - Methods
    
    func fetchData(with url: URL, completionHandler: @escaping FetchDataCompletion)
    
}
