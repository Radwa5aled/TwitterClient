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
        
        let loginBtn = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                self.loginView?.sentSuccess(session: session!)
            } else {
                self.loginView?.sentFailed(error: error)
            }
        })
        
        self.loginView?.addLoginBtn(btnLogin: loginBtn)
        
        
    }
    
    
}
