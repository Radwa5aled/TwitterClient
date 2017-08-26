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
   internal static func apiGetFollowers(parameters: [String : Any], twitterClient: TWTRAPIClient ,sucess: @escaping ((_ followersInfo: ModFollowers) -> Void), failure:@escaping (( _ NSError: String?) -> Void))
    {

        NetworkHelper.networkRequester(domainUrl: nil, service: Constants.getFollowersUrl, hTTPMethod: .get, parameters: parameters, twitterClient: twitterClient, callbackNoInternet: {
            
            failure("")
            
        }) { (json, error) in
            
            if json != JSON.null {
                
                let res = ModFollowers(JSON: json.dictionaryObject!)
                
                
                sucess(res!)
                
            }else {
                
                failure("fail")
            }
            
        }
        
        
    }
    
    internal static func apiGetUserTimline(parameters: [String : Any], twitterClient: TWTRAPIClient ,sucess: @escaping ((_ timlineInfo: [ModUserTimline], _ tweets: [Any]) -> Void), failure:@escaping (( _ NSError: String?) -> Void))
    {
        
        NetworkHelper.networkRequester(domainUrl: nil, service: Constants.getUserTimline, hTTPMethod: .get, parameters: parameters, twitterClient: twitterClient, callbackNoInternet: {
            
            failure("")
            
        }) { (json, error) in
            
            if json != JSON.null {
                
               let tweets = TWTRTweet.tweets(withJSONArray: json.arrayObject! as! [[String : Any]])
                
                let res = Mapper<ModUserTimline>().mapArray(JSONArray: json.arrayObject! as! [[String : Any]])
                
                sucess(res, tweets)
                
            }else {
                
                failure("fail")
            }
            
        }
        
        
    }

    
}
