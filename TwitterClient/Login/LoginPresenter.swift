//
//  LoginPresenter.swift
//  TwitterClient
//
//  Created by Radwa on 8/24/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import Foundation
import TwitterKit

class LoginPresenter {
    
    weak private var loginView : LoginView?
    
    
    
    func attachView(view:LoginView){
        loginView = view
    }
    
    func twitterLogin() {
        
        Twitter.sharedInstance().logIn(completion: { (session, error) in
            if (session != nil) {
                
                UserDefaults.standard.set(session?.userName, forKey: "userName")
                
                self.loginView?.sentSuccess(session: session!)
            } else {
                self.loginView?.sentFailed(error: error)
            }
        })
        
        
    }
    
    
}
