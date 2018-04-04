//
//  Helper.swift
//  ChatDemo
//
//  Created by hema on 2/11/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import UIKit

class Helper: NSObject {
    
    class func RestartApp()
    {
        guard let window = UIApplication.shared.keyWindow else
        {
            return
        }
        let sb = UIStoryboard(name: "Main", bundle: nil)
        var VC: UIViewController
        if GetApiToken() == nil
        {
            VC = sb.instantiateInitialViewController()!
        }
        else
        {
            VC = sb.instantiateViewController(withIdentifier: "MainVC")
        }
        window.rootViewController = VC
        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        
    }
    class func SaveApiToken(token: String)
    {
        let def = UserDefaults.standard
        def.setValue(token, forKey: "api_token")
        def.synchronize()
        RestartApp()
    }
    class func GetApiToken() -> String?
    {
        let def = UserDefaults.standard
        return def.object(forKey: "api_token") as? String
        
    }
    class func SaveUserData(id: Int, name: String, type: String, Pic_URL: String)
    {
        let defdata = UserDefaults.standard
        defdata.setValue(id, forKey: "id")
        defdata.setValue(name, forKey: "name")
        defdata.setValue(type, forKey: "type")
        defdata.setValue(Pic_URL, forKey: "picture_url")
        defdata.synchronize()
        RestartApp()
    }
    class func GetUserID() -> Int?
    {
        let defdata = UserDefaults.standard
        return defdata.object(forKey: "id") as? Int
    }
    class func GetUserName() -> String
    {
        let defdata = UserDefaults.standard
        return (defdata.object(forKey: "name") as? String)!
    }
    class func GetUserType() -> String
    {
        let defdata = UserDefaults.standard
        return (defdata.object(forKey: "type") as? String)!
    }
    class func GetUserPicURL() -> String
    {
        let defdata = UserDefaults.standard
        return (defdata.object(forKey: "picture_url") as? String)!
    }

}
