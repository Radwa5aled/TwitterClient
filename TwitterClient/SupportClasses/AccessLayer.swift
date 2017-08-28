//
//  AccessLayer.swift
//  TwitterClient
//
//  Created by Radwa on 8/25/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import Foundation
import TwitterKit
import SwiftyJSON
import ObjectMapper

class AccessLayer {
    
    //#MARK:- GetFollowers
   internal static func apiGetFollowers(parameters: [String : Any], twitterClient: TWTRAPIClient ,sucess: @escaping ((_ followersInfo: ModFollowers) -> Void), failure:@escaping (( _ NSError: String?) -> Void), noInternet:@escaping ((_ followersCachedInfo: ModFollowers?) -> Void))
    {
        
        NetworkHelper.networkRequester(domainUrl: nil, service: Constants.getFollowersUrl, hTTPMethod: .get, parameters: parameters, twitterClient: twitterClient, callbackNoInternet: {
            
            
            if let cachedVersion = UserDefaults.standard.object(forKey: "cachedFollowers") as? NSData {
                
                // use the cached object
                let obj = NSKeyedUnarchiver.unarchiveObject(with: cachedVersion as Data) as! ModFollowers
                 noInternet(obj)
                
            }else {
                
                print("❌ no cacheeeee")
                noInternet(nil)
                
            }
            
        }) { (json, error) in
            
            if json != JSON.null {
                
                let res = ModFollowers(JSON: json.dictionaryObject!)
                
                //cache followers object for offline mode
                UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: res!), forKey: "cachedFollowers")
                
                sucess(res!)
                
            }else {
                
                if let err = error?.localizedDescription {
                    failure(err)
                }else {
                    failure("fail")
                }
            }
            
        }
        
        
    }
    
    internal static func apiGetUserTimline(parameters: [String : Any], twitterClient: TWTRAPIClient ,sucess: @escaping ((_ timlineInfo: [ModUserTimline], _ tweets: [Any]) -> Void), failure:@escaping (( _ NSError: String?) -> Void), noInternet:@escaping (( _ NSError: String?) -> Void))
    {
        
        NetworkHelper.networkRequester(domainUrl: nil, service: Constants.getUserTimline, hTTPMethod: .get, parameters: parameters, twitterClient: twitterClient, callbackNoInternet: {
            
             noInternet("")
            
        }) { (json, error) in
            
            if json != JSON.null {
                
               let tweets = TWTRTweet.tweets(withJSONArray: json.arrayObject! as! [[String : Any]])
                
                let res = Mapper<ModUserTimline>().mapArray(JSONArray: json.arrayObject! as! [[String : Any]])
                
                sucess(res, tweets)
                
            }else {
                
                if let err = error?.localizedDescription {
                    failure(err)
                }else {
                    failure("fail")
                }
            }
            
        }
        
        
    }

    
}
