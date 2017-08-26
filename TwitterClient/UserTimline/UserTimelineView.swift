//
//  UserTimelineView.swift
//  TwitterClient
//
//  Created by Radwa on 8/26/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import Foundation

protocol UserTimelineView: NSObjectProtocol {
    
    func startLoading()
    func finishLoading()
    func sentSuccess(userTimlineData: [ModUserTimline], tweetsData: [Any])
    func sentFailed()
    
}
