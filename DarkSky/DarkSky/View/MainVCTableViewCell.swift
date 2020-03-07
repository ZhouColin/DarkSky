//
//  MainVCTableViewCell.swift
//  DarkSky
//
//  Created by Colin Zhou on 2020-03-05.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit

class MainVCTableViewCell: UITableViewCell {

    @IBOutlet weak var dayName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func configure(with representable: WeekDay) {
        dayName.text = representable.day
        date.text = representable.date
        icon.image = representable.image
        temperature.text = representable.temperature
    }

}
