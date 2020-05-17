//
//  ViewController.swift
//  MVC-MVVM
//
//  Created by Adriana González Martínez on 4/12/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var dataSource: [MessierDataModel] = [Messier1, Messier8, Messier57]

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDetail" {
            
            if let destinationViewController = segue.destination as? DetailViewController
            {
                let indexPath = self.tableView.indexPathForSelectedRow!
                let index = indexPath.row
                // #2 - The ViewModel is the app's de facto data source.
                // The ViewModel data for the currently-selected table
                // view cell representing a Messier object is passed to
                // a detail view controller via a segue.
                destinationViewController.messierViewModel = messierViewModel[index]
            }
        }
        
    }

    
}
