//
//  Extensions.swift
//  TwitterClient
//
//  Created by Radwa on 8/25/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

extension UIViewController {
    
    func alert(title: String, message: String, viewController: UIViewController ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func setNVActivityIndicatorView(viewController: UIViewController, rectProgress:CGRect,progressType: NVActivityIndicatorType, progressColor: UIColor) -> (NVActivityIndicatorView) {
        
        var activityProgress: NVActivityIndicatorView?
       // let rectProgress = CGRect(x: viewController.view.bounds.width/2 - 67.0, y: viewController.view.bounds.height/2 - 67.0, width: 134.0, height: 134.0)
        activityProgress = NVActivityIndicatorView(frame: rectProgress, type: progressType, color: progressColor, padding: 12)
        viewController.view.addSubview(activityProgress!)
        viewController.view.bringSubview(toFront: activityProgress!)
        
        return activityProgress!
    }
    
}
