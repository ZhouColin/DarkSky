//
//  NetworkManager.swift
//  Rainstorm
//
//  Created by Colin Zhou on 2020-03-05.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import Foundation

class NetworkManager: NetworkService {
    
    // MARK: - Network Service
    
    func fetchData(with url: URL, completionHandler: @escaping NetworkService.FetchDataCompletion) {
        URLSession.shared.dataTask(with: url, completionHandler: completionHandler).resume()
    }
    
}
