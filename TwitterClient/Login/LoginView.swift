//
//  LoginView.swift
//  TwitterClient
//
//  Created by Radwa on 8/24/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import Foundation
import TwitterKit

protocol LoginView: NSObjectProtocol {
    
    func sentSuccess(session: TWTRSession)
    func sentFailed(error: Error?)
    
}
