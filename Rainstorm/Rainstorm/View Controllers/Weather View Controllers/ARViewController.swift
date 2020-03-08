//
//  ARViewController.swift
//  Rainstorm
//
//  Created by Colin Zhou on 2020-03-07.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

import UIKit
import QuickLook
import ARKit

class ARViewController: UIViewController, QLPreviewControllerDataSource {
    
    var modelArray : [String] = ["clear-day", "clear-night", "cloudy", "fog", "rain", "sleet", "snow", "wind"]
    var selectedModel: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        let previewController = QLPreviewController()
        previewController.dataSource = self
        present(previewController, animated: true, completion: nil)
    }

    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let url = Bundle.main.url(forResource: "chair_swan", withExtension: "usdz")!
        return url as QLPreviewItem
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
