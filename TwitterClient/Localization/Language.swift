//
//  Language.swift
//  MTC
//
//  Created by ispha on 8/2/17.
//  Copyright © 2017 Appsinnovate. All rights reserved.
//

import UIKit
class Language{
    class func currentLanguage()->String{
        let def = UserDefaults.standard
        let lang = def.object(forKey: "AppleLanguages") as! NSArray
        let currentLanguage = lang.firstObject as! String
        let mostLang = currentLanguage.components(separatedBy: "-")[0].lowercased()
            //.componentsSeparatedByString("-")[0].lowercaseString
        return mostLang
        
    }
    class func setAppLanguage(language:String){
        let def = UserDefaults.standard
        
        def.set([language,currentLanguage()], forKey: "AppleLanguages")
        def.synchronize()
    }
    
    class func changeLanguages() {
        if currentLanguage() == "ar"{
            setAppLanguage(language: "en-US")
            AppConstants.currentLanguage = 1
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            UINavigationBar.appearance().semanticContentAttribute = .forceLeftToRight
            
        }
        else{
            setAppLanguage(language: "ar")
            AppConstants.currentLanguage = 2
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
        }
    }
    
    class func localizeStringForKey(word:String)->String{
        let localizedWord = NSLocalizedString(word, comment: "@ispha")
        return localizedWord
    }
}
