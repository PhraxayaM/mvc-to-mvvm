//
//  Extension+TableViewDataSource.swift
//  MVC-MVVM
//
//  Created by MattHew Phraxayavong on 5/16/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UITableView Data Source

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messierViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        // #1 - The ViewModel is the app's de facto data source.
        tableViewCell?.imageView?.image = UIImage(named: messierViewModel[indexPath.row].thumbnail)
        tableViewCell?.textLabel?.text = messierViewModel[indexPath.row].formalName
        tableViewCell?.detailTextLabel?.text = messierViewModel[indexPath.row].commonName
        
        return tableViewCell!
    }
    
} // end extension ViewController : UITableViewDataSource
