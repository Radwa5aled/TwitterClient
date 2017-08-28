//
//  SplashViewController.swift
//  TwitterClient
//
//  Created by Radwa on 8/25/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class SplashViewController: UIViewController {
    
    private let splashPresenter = SplashPresenter()
    
     var activityProgress: NVActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        
        splashPresenter.attachView(view: self)
        
        // Add indicator
        let progressSize = CGRect(x: self.view.bounds.width/2 - 67.0, y: self.view.bounds.height/2 - 67.0, width: 134.0, height: 134.0)
        activityProgress = self.setNVActivityIndicatorView(viewController: self, rectProgress: progressSize, progressType: .ballScale, progressColor:UIColor.white)
    
        //check if there's stored accounts or not
        splashPresenter.getStoredAccount()
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


extension SplashViewController: SplashView {
    
    func sentSuccess() {
        
        print("✅✅ go to followers from splash")
        
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "splashToFollowers", sender: self)

        }
        
        
        
    }
    
    func sentFailed() {
        
        DispatchQueue.main.async {
            
            self.performSegue(withIdentifier: "splashToLogin", sender: self)

        }
        
        
    }
    
    func startLoading() {
       
        self.activityProgress?.startAnimating()
    }
    
    func finishLoading() {
         self.activityProgress?.stopAnimating()
    }
    
}
