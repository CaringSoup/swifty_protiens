//
//  ViewController.swift
//  SwiftyProteins
//
//  Created by Naledi MATUTOANE on 2019/12/02.
//  Copyright © 2019 Naledi MATUTOANE. All rights reserved.
//

import UIKit
import LocalAuthentication

class FirstViewController: UIViewController {
    @IBAction func button(_ sender: Any) {
        AuthManager.TouchIDAuth(view: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReadFile.readFile(fileName: "Ligands", fileExt: "txt")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ProteinsTableViewController {
            _ = segue.destination as! ProteinsTableViewController
        }
    }
}

extension UIViewController {
    func showAlertController(_ message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
