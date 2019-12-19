//
//  Downloader.swift
//  SwiftyProteins
//
//  Created by Naledi MATUTOANE on 2019/12/11.
//  Copyright © 2019 Naledi MATUTOANE. All rights reserved.
//

import Foundation
import UIKit

class Downloader {
    var view: ProteinsTableViewController?
    var alert: UIAlertController
    
    init(view: ProteinsTableViewController) {
        self.view = view
        
        let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
        }
        
        alert = UIAlertController(title: "Oops", message: "The requested model cannot be displayed at this time", preferredStyle: .alert)
        alert.addAction(action)
    }
    
    func load(URL: URL) {
        let task = URLSession.shared.dataTask(with: URL) {
            localUrl, response, error in
            if error == nil {
                if let fileUrl = localUrl {
                    let res: HTTPURLResponse = response as! HTTPURLResponse
                    if res.statusCode == 200 {
                        do {
                            if let string = String(data: fileUrl, encoding: .utf8) {
                                let array = string.components(separatedBy: "\n")
                                self.view!.model = Molecules.constructLigand(contents: array)
                            }
                            else {
                                DispatchQueue.main.async {
                                    self.view!.present(self.alert, animated: true, completion: nil)
                                }
                            }
                        }
                    }
                    else {
                        DispatchQueue.main.async {
                            self.view!.present(self.alert, animated: true, completion: nil)
                        }
                    }
                }
            }
        }
        task.resume()
    }
}
