//
//  SplashView.swift
//  TwitterClient
//
//  Created by Radwa on 8/25/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import Foundation
import TwitterKit

protocol SplashView: NSObjectProtocol {
    
    func startLoading()
    func finishLoading()
    func sentSuccess()
    func sentFailed()
    
}
