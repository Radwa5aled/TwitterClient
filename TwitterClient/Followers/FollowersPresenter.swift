//
//  FollowersPresenter.swift
//  TwitterClient
//
//  Created by Radwa on 8/25/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import Foundation
import TwitterKit

class FollowersPresenter {
    
    private let accessLayer:AccessLayer
    weak private var followersView : FollowersView?
    
    init(service:AccessLayer){
        self.accessLayer = service
    }
    
    func attachView(view:FollowersView){
        followersView = view
    }
    
    func getFollowersData() {
        
        if let userID = Twitter.sharedInstance().sessionStore.session()?.userID {
            
            let client = TWTRAPIClient(userID: userID)
            
            AccessLayer.apiGetFollowers(parameters: ["count": "10"], twitterClient: client, sucess: { (suc) in
                
                self.followersView?.sentSuccess(followerData: suc)
                
            }) { (err) in
                if err == "fail" {
                    
                    self.followersView?.sentFailed()
                    
                }else {
                    print("❌❌❌ noInternet")
                    
                }
                
            }
            
        }
        
    }
    
}
