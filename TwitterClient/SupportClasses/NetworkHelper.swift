//
//  NetworkHelper.swift
//  TwitterClient
//
//  Created by Radwa on 8/25/17.
//  Copyright © 2017 Eventus. All rights reserved.
//

import Foundation
import TwitterKit
import SwiftyJSON

enum Method : String
{
    case get="GET"
    case post="POST"
    
}


class NetworkHelper {
    
   internal static func networkRequester(
        domainUrl:String?,
        service:String,
        hTTPMethod: Method,
        parameters: [String:Any]? = nil,
        twitterClient: TWTRAPIClient,
        callbackNoInternet: (() -> Void)? = nil,
        callbackSwiftyDic: ((_ JSON: JSON, _ Error: Error?) -> Void)? = nil)
        {
        
         var clientError : NSError?
         let UrlString = (domainUrl == nil ? Constants.domainUrl : domainUrl!)+service
        
        
        
         let request = twitterClient.urlRequest(withMethod: hTTPMethod.rawValue,
                                        url: UrlString,
                                        parameters: parameters,
                                        error: &clientError)
        
         twitterClient.sendTwitterRequest(request) { (response, responseData, connectionError) -> Void in
            if connectionError != nil {
                print("❌ \(String(describing: connectionError?.localizedDescription))")
                
                callbackNoInternet!()
                
            }
            
            print("✅ responseData>>  \(JSON(data: responseData!))")
            
            if responseData == nil {
                
                callbackSwiftyDic!(JSON.null, NSError.self as? Error)

                
            }else {
                callbackSwiftyDic!(JSON(data: responseData!), nil)

            }
            
            
        
        }// end response
        
        
        
    }
    
    
}
