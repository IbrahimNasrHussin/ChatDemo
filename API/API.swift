//
//  API.swift
//  ChatDemo
//
//  Created by hema on 2/11/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API: NSObject {
    
    class func login(email: String, password: String, completion: @escaping (_ error: Error? , _ sucess: Bool )-> Void){
        
        let url = URLs.login
        let parameters = ["email":email,
                          "password":password
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200...200)
            .responseJSON { response in
                switch response.result
                {
                case.failure(let error):
                    completion(error,false)
                    print(error)
                case.success(let value):
                    let json = JSON(value)
                    
                    if let api_token = json["token"].string
                    {
                    print("api_token : \(api_token)")
                    Helper.SaveApiToken(token: api_token)
                        completion(nil,true)
                    }
                    
                    let user_data = json["data"].dictionaryValue
                    print(user_data)
                    var userss = [User]()
                    for (k,v) in user_data
                    {
                        userss.append(User(id: v["id"].intValue, name: v["name"].stringValue, type: v["type"].stringValue, Pic_URL: v["picture_url"].stringValue)!)
                    }
                }
        }

    }

}
