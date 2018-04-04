//
//  APIContacts.swift
//  ChatDemo
//
//  Created by hema on 2/11/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import MBProgressHUD
import Kingfisher

extension API
{
    class func contacts(view :UIView, completion : @escaping (_ error:Error?, _ contacts:[Contacts]?)->Void)
    {
        let url = URLs.contacts
        guard let api_token = Helper.GetApiToken() else
        {
            completion(nil,nil)
            return
        }
        let parameters =
            ["api_token" : api_token
            ]
        MBProgressHUD.showAdded(to: view, animated: true)
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON{ response in
                MBProgressHUD.hide(for: view, animated: true)
                switch response.result
                {
                    case.failure(let error):
                    completion(error,nil)
                    print(error)
                    case.success(let value):
                    let json = JSON(value)

                    let dictdata = json["contacts"].dictionaryValue
                    var contactts = [Contacts]()
                    for (_,v) in dictdata
                    {
                        contactts.append(Contacts(id: v["id"].intValue, name: v["name"].stringValue, type: v["type"].stringValue, Pic_URL: v["picture_url"].stringValue)!)
                    }
                    completion(nil,contactts)
                }
            }
    }
}

