//
//  ViewController.swift
//  DarkSky
//
//  Created by Colin Zhou on 2020-03-05.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit
import CoreLocation

class MainVC: UIViewController {
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var uvIndex: UILabel!
    @IBOutlet weak var visibility: UILabel!
    @IBOutlet weak var ozone: UILabel!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.isHidden = true
            tableView.dataSource = self
            tableView.separatorInset = .zero
            tableView.estimatedRowHeight = 44.0
            tableView.showsVerticalScrollIndicator = false
            tableView.rowHeight = UITableView.automaticDimension
        }
    }
    
    var viewModel: WeekView? {
        didSet {
            
            if let viewModel = viewModel {
                // Setup View Model
                setupViewModel(with: viewModel)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestLocation()
        
//        fetchWeatherData()
        
    }
    
    private func setupViewModel(with viewModel: WeekView) {
        // Update Table View
        tableView.reloadData()
        tableView.isHidden = false
    }
    
    let locationManager = CLLocationManager()
    var userLocation = CLLocation()
    private static let apiKey = "c0fda1f5e8fdb50ef7757a854a395316"
    private static let baseUrl = URL(string: "https://api.darksky.net/forecast/")!
    
    var authenticatedBaseUrl: URL {
        return MainVC.baseUrl.appendingPathComponent(MainVC.apiKey)
    }
    
    private let networkService: NetworkService
    private let locationService: LocationService
    
    init(networkService: NetworkService, locationService: LocationService) {
        // Set Services
        self.networkService = networkService
        self.locationService = locationService

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func fetchWeatherData(for location: Location) {
        // Initialize Weather Request
        let weatherRequest = WeatherRequest(baseUrl: authenticatedBaseUrl, location: location)
        
        // Fetch Weather Data
        networkService.fetchData(with: weatherRequest.url) { [weak self] (data, response, error) in
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            
            DispatchQueue.main.async {
                if let error = error {
                    print("Unable to Fetch Weather Data \(error)")
                    
                    // Weather Data Result
                    let result: WeatherDataResult = .failure(.noWeatherDataAvailable)
                    
                    // Invoke Completion Handler
                    self?.didFetchWeatherData?(result)
                } else if let data = data {
                    // Initialize JSON Decoder
                    let decoder = JSONDecoder()
                    
                    // Configure JSON Decoder
                    decoder.dateDecodingStrategy = .secondsSince1970
                    
                    do {
                        // Decode JSON Response
                        let darkSkyResponse = try decoder.decode(DarkSkyResponse.self, from: data)
                        // Update User Defaults
                        UserDefaults.didFetchWeatherData = Date()
                        
                        // Invoke Completion Handler
                        self?.didFetchWeatherData?(result)
                    } catch {
                        print("Unable to Decode JSON Response \(error)")
                        
                        // Invoke Completion Handler
                        self?.didFetchWeatherData?(result)
                    }
                } else {

                }
            }
        }
    }
    
    private func fetchWeatherData() {
        // Create Base URL
        guard let baseUrl = URL(string: "https://api.darksky.net/forecast/") else {
            return
        }

        // Append API Key
        let authenticatedBaseUrl = baseUrl.appendingPathComponent("c0fda1f5e8fdb50ef7757a854a395316")

        // Create URL
        let url = authenticatedBaseUrl.appendingPathComponent("\(userLocation.coordinate.latitude),\(userLocation.coordinate.longitude)")

        // Create Data Task
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Request Did Fail (\(error)")
            } else if let response = response {
                print(response)
            }
        }.resume()
    }


}

extension MainVC: CLLocationManagerDelegate {
  // handle delegate methods of location manager here
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // .requestLocation will only pass one location to the locations array
        // hence we can access it by taking the first element of the array
        userLocation = locations.first!
    }
    
}
