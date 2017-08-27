//
//  Localizer.swift
//  MTC
//
//  Created by ispha on 8/2/17.
//  Copyright © 2017 Appsinnovate. All rights reserved.
//

import UIKit
class Localizer {
    class func DoLangaueExchange(){
        swilizeLocalizedMethod(className: Bundle.self, originalSelector: #selector(Bundle.localizedString(forKey:value:table:)), overrideSelector: #selector(Bundle.customLocalizedStringForKey(key:value:table:)))
        //swilizeLocalizedMethod(className: Bundle.self, originalSelector: #selector(getter: UIApplication.userInterfaceLayoutDirection), overrideSelector: #selector(getter: UIApplication.customuserInterface))
    }
}

extension Bundle{
    func customLocalizedStringForKey(key:String ,value:String?,table tableName:String)->String{
        let currentLanguage = Language.currentLanguage()
        var bundel = Bundle()
        if let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj"){
            bundel = Bundle(path: path)!
        }
        else{
            let path  = Bundle.main.path(forResource: "Base", ofType: "lproj")
            bundel = Bundle(path: path!)!
        }
        return bundel.customLocalizedStringForKey(key: key, value: value, table: tableName)
    }
}

extension UIApplication{
    var customuserInterface:UIUserInterfaceLayoutDirection{
        get{
            var direction = UIUserInterfaceLayoutDirection.leftToRight
            if Language.currentLanguage().components(separatedBy: "-")[0].lowercased() == "ar" {
                direction = UIUserInterfaceLayoutDirection.rightToLeft
            }
            return direction
        }
    }
}

func swilizeLocalizedMethod(className:AnyClass,originalSelector:Selector,overrideSelector:Selector){
    let originalMethod =  class_getInstanceMethod(className,originalSelector)
    let overrideMethod = class_getInstanceMethod(className, overrideSelector)
    
    if class_addMethod(className, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod)){
        class_replaceMethod(className, overrideSelector,method_getImplementation(originalMethod) , method_getTypeEncoding(originalMethod))
    }
    else{
        method_exchangeImplementations(originalMethod, overrideMethod)
    }
    
}
