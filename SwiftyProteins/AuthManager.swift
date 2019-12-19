//
//  AuthManager.swift
//  SwiftyProteins
//
//  Created by Naledi MATUTOANE on 2019/12/17.
//  Copyright © 2019 Naledi MATUTOANE. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication

class AuthManager {
    class func TouchIDAuth(view: Any) {
        let context = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            let reason = "Authenticate with Touch ID"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply:
                {(success, error) in
                    DispatchQueue.main.sync {
                        if success {
                            (view as! UIViewController).performSegue(withIdentifier: "proteinsList", sender: self)
                        }
                        else {
                            (view as! UIViewController).showAlertController("Touch ID Authentication failed. Please try again.")
                        }
                    }
            })
        }
        else {
            DispatchQueue.main.async {
                (view as! UIViewController).performSegue(withIdentifier: "proteinsList", sender: self)
            }
        }
    }
}
