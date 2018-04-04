//
//  APIGroups.swift
//  ChatDemo
//
//  Created by hema on 2/21/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import MBProgressHUD
import Kingfisher

extension API
{
    class func groups(view:UIView,completion :@escaping (_ error:Error?, _ groups:[Groups]?)->Void)
    {
        let url = URLs.groups
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
                    
                    let dictdata = json["groups"].arrayValue
                    var groupss = [Groups]()
                    for item in dictdata
                    {
                  
                        groupss.append(Groups(group_id: item["id"].intValue, group_name: item["name"].stringValue, group_type: item[""].stringValue, group_Pic_id: item["image_id"].stringValue, group_Pic_URL: item["picture_url"].stringValue, members: item["members"].arrayObject!)!)
                    }
                    completion(nil,groupss)
                
                 
                }
        }
    }

   /* class func DeleteGroup(group : Groups ,completion : (_ error : Error?, _ sucess : Bool) -> Void)
    {
        let url = URLs.DeleteGroup
        guard let api_token = Helper.GetApiToken()
            else
        {
            completion(nil,false)
        }
        let parameters : [String , Any] = ["api_token" : api_token , "group_id" : ]
        
    }*/

}











