//
//  Constants.swift
//  TwitterClient
//
//  Created by Radwa on 8/24/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import Foundation


class Constants: NSObject {
    
    //MARK: Twitter Keys
    
    internal static let twitterConsumerKey = "nCby1b1JtQZv48Qp03VeuEepF"
    internal static let twitterConsumerSecret = "BnShsMVhyXpdqe9ARvmpObNVm2EzuuMugDgMvbYgr1V8wgiRQC"
    
    //MARK: Api Urls
    
    internal static let domainUrl = "https://api.twitter.com/1.1/"
    internal static let getFollowersUrl = "followers/list.json"
    internal static let getUserTimline = "statuses/user_timeline.json"
    
}
