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
    
    func getFollowersData(curser: Int, infiniteRefresher: Bool, displayIndicator: Bool) {
      
        if displayIndicator {
            self.followersView?.startLoading()
        }
        
        
        if let userID = Twitter.sharedInstance().sessionStore.session()?.userID {
            
            let client = TWTRAPIClient(userID: userID)
            
            let params: [String : Any]!
            
            if curser != 0 {
                
                params = ["count": "10", "cursor":"\(curser)"]
                
            }else {
                
                params = ["count": "10"]
                
            }
            
            
            AccessLayer.apiGetFollowers(parameters: params, twitterClient: client, sucess: { (suc) in
               
                self.followersView?.sentSuccess(followerData: suc, append: infiniteRefresher)
                self.followersView?.finishLoading()

            }, failure: { (err) in
                    
                self.followersView?.sentFailed(error: err!)
                self.followersView?.finishLoading()
                    
            }, noInternet: { (offlineCachedObject) in
                print("❌❌❌ no Internet in getFollowersData")
               
                if offlineCachedObject != nil {
                    
                    self.followersView?.sentSuccess(followerData: offlineCachedObject!, append: infiniteRefresher)
                
                }else {
                    
                    self.followersView?.sentFailed(error: "The Internet connection appears to be offline")
                }
                
                self.followersView?.finishLoading()
            })
            
            
        }
        
    }
    
}
