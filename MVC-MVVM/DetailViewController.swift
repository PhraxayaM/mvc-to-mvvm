//
//  DetailViewController.swift
//  MVC-MVVM
//
//  Created by Adriana González Martínez on 4/12/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var data: MessierDataModel!
    var messierViewModel: MessierViewModel?
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        topLabel.text = data.commonName
        topLabel.text = messierViewModel?.formalName
        bottomLabel.text = messierViewModel?.commonName
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
//        let request = URLRequest(url:URL(string: data.imageLink)!)
        let request = URLRequest(url:URL(string: messierViewModel!.imageLink)!)
        
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            
            if let tempLocalUrl = tempLocalUrl, error == nil {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    let rawImageData = NSData(contentsOf: tempLocalUrl)
                    print("Successfully downloaded. Status code: \(statusCode)")
                    
                    DispatchQueue.main.async {
                        
                        UIView.animate(withDuration: 1.0, animations: {
                            self.imgView.alpha = 1.0
                            self.imgView?.image = UIImage(data: rawImageData! as Data)
                            self.view.setNeedsDisplay()
                        })
                    }
                    
                }
                
            } else {
                print("Error took place while downloading a file. Error description: \(String(describing: error?.localizedDescription))")
            }
        }
        
        task.resume()
        
    }
    
}
