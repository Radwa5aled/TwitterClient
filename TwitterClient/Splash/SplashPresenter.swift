//
//  SplashPresenter.swift
//  TwitterClient
//
//  Created by Radwa on 8/25/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import Foundation
import TwitterKit

class SplashPresenter {
    
    weak private var splashView : SplashView?
    
    func attachView(view:SplashView){
        splashView = view
    }
    
    func getStoredAccount() {
        
        self.splashView?.startLoading()
        
        let accountStore = ACAccountStore()
        let accountType = accountStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
        accountStore.requestAccessToAccounts(with: accountType, options: nil) { granted, error in
            guard granted else {
                
                if UserDefaults.standard.object(forKey: "userName") != nil {
                    self.splashView?.sentSuccess()
                    
                }else {
                    
                    self.splashView?.sentFailed()
                }
                
                self.splashView?.finishLoading()
                return
            }
            
            let twitterAccounts = accountStore.accounts(with: accountType)!
            if !twitterAccounts.isEmpty {
                
                let twitterAccount = twitterAccounts[0] as! ACAccount
                
                UserDefaults.standard.set(twitterAccount.username, forKey: "userName")
                
                self.splashView?.finishLoading()
                self.splashView?.sentSuccess()
                
                
            }else {
                
                self.splashView?.finishLoading()
                self.splashView?.sentFailed()
                
            }
            
            
            
            
        }
        
    }
    
    
}
