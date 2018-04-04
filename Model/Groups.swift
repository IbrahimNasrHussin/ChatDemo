//
//  Groups.swift
//  ChatDemo
//
//  Created by hema on 2/18/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import UIKit
import SwiftyJSON

class Groups: NSObject
{
    var group_id: Int
    var group_name: String
    var group_type: String
    var group_Pic_id: String
    var group_Pic_URL : String
    var members : [Any]
 

    init?(group_id: Int, group_name: String, group_type: String, group_Pic_id: String, group_Pic_URL: String, members:[Any])
    {
        self.group_id = group_id
        self.group_name = group_name
        self.group_type = group_type
        self.group_Pic_id = group_Pic_id
        self.group_Pic_URL = group_Pic_URL
        self.members = members

    }
  //  init?(dict: [String : JSON])
//    {
//        guard let group_id = dict["id"]?.int, let group_name = dict["name"]?.string, let group_type = dict["type"]?.string, let group_Pic_id = dict["image_id"]?.int, let group_Pic_URL = dict["picture_url"]?.string, let mem_id  = dict["members"]!["id"].int, let mem_name = dict["members"]!["name"].string, let mem_type = dict["members"]!["type"].string, let mem_Pic_URL = dict["members"]!["picture_url"].string
//            else
//            {
//            return nil
//            }
//        self.group_id = group_id
//        self.group_name = group_name
//        self.group_type = group_type
//        self.group_Pic_id = group_Pic_id
//        self.group_Pic_URL = group_Pic_URL
//        self.mem_id = mem_id
//        self.mem_name = mem_name
//        self.mem_type = mem_type
//        self.mem_Pic_URL = mem_Pic_URL
//    }


}
