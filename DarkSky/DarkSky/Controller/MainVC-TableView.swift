//
//  MainVC-TableView.swift
//  DarkSky
//
//  Created by Colin Zhou on 2020-03-05.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//
import UIKit

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainVCTableViewCell", for: indexPath) as! MainVCTableViewCell
        guard let viewModel = viewModel else {
            fatalError("No View Model Present")
        }
        // Configure Cell
        cell.configure(with: viewModel.viewModel(for: indexPath.row))
        return cell
    }
    
    
}
