//
//  FollowersView.swift
//  TwitterClient
//
//  Created by Radwa on 8/25/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import Foundation

protocol FollowersView: NSObjectProtocol {

    func startLoading()
    func finishLoading()
    func sentSuccess(followerData: ModFollowers)
    func sentFailed()
    
}
