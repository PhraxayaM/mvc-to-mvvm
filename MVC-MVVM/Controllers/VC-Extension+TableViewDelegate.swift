//
//  File.swift
//  MVC-MVVM
//
//  Created by MattHew Phraxayavong on 5/16/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import Foundation
import UIKit
 
// MARK: - UITableView Delegate
 
extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
