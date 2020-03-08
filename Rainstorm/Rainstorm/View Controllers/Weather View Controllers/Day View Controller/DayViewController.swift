//
//  DayViewController.swift
//  DarkSky
//
//  Created by Colin Zhou on 2020-03-05.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit

final class DayViewController: UIViewController {
    
    var viewModel: DayViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            
            // Setup View Model
            setupViewModel(with: viewModel)
        }
    }
    @IBOutlet var dateLabel: UILabel! {
        didSet {
            dateLabel.textColor = UIColor.Rainstorm.baseTextColor
            dateLabel.font = UIFont.DarkSky.heavyLarge
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? ARViewController, segue.identifier == "toPokemonSegue" {
            destVC.selectedModel = ""
        }
    }

    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var uvIndexLabel: UILabel!
    @IBOutlet var visibilityLabel: UILabel!
    
    @IBOutlet var iconImageView: UIImageView! {
        didSet {
            iconImageView.contentMode = .scaleAspectFit
            iconImageView.tintColor = UIColor.Rainstorm.baseTintColor
        }
    }

    @IBOutlet var regularLabels: [UILabel]! {
        didSet {
            for label in regularLabels {
                label.textColor = .black
                label.font = UIFont.DarkSky.lightRegular
            }
        }
    }
    
    @IBOutlet var smallLabels: [UILabel]! {
        didSet {
            for label in regularLabels {
                label.textColor = .black
                label.font = UIFont.DarkSky.lightSmall
            }
        }
    }
    
    @IBOutlet var weatherDataViews: [UIView]! {
        didSet {
            for view in weatherDataViews {
                view.isHidden = true
            }
        }
    }
    
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView! {
        didSet {
            activityIndicatorView.startAnimating()
            activityIndicatorView.hidesWhenStopped = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View
        setupView()
    }
    
    private func setupView() {
        // Configure View
        view.backgroundColor = UIColor.Rainstorm.lightBackgroundColor
    }

    
    private func setupViewModel(with viewModel: DayViewModel) {
        // Hide Activity Indicator View
        activityIndicatorView.stopAnimating()
        
        // Configure Labels
        dateLabel.text = viewModel.date
        timeLabel.text = viewModel.time
        windSpeedLabel.text = viewModel.windSpeed
        temperatureLabel.text = viewModel.temperature
        descriptionLabel.text = viewModel.summary
        humidityLabel.text = "\(viewModel.humidity)%"
        pressureLabel.text = "\(viewModel.pressure) Hg"
        visibilityLabel.text = "\(viewModel.visibility) mi"
        uvIndexLabel.text = "uv: \(viewModel.uvIndex)"
        
        
        // Configure Icon Image View
        iconImageView.image = viewModel.image
        
        // Show Weather Data Views
        for view in weatherDataViews {
            view.isHidden = false
        }
    }
    
}
