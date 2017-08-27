//
//  Initializer.swift
//  MTC
//
//  Created by ispha on 8/2/17.
//  Copyright © 2017 Appsinnovate. All rights reserved.
//

import UIKit
class Initializer {
    
    class func getStoryBoard()-> UIStoryboard {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard
    }
    
    class func createViewControllerWithId(storyBoardId:String)->UIViewController{
        let storboard = getStoryBoard()
        let vc = storboard.instantiateViewController(withIdentifier: storyBoardId)
        return vc
        
    }
    class func createNavigation()->UINavigationController {
        let storyboard = getStoryBoard()
        let navigation = storyboard.instantiateViewController(withIdentifier: "RootNC") as! UINavigationController
        return navigation
    }
    class func getWindow()->UIWindow{
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let window = appdelegate.window
        return window!
    }
    
    class func getMainNavigation()->UINavigationController{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let window = appDelegate.window
        let navigation = window?.rootViewController as! UINavigationController
        return navigation
        
    }
    
    
}
