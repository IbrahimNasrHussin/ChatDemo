//
//  User.swift
//  ChatDemo
//
//  Created by hema on 3/31/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import UIKit
import SwiftyJSON

class User: NSObject {
    
    var id: Int = 0
    var name: String = ""
    var type: String = ""
    var Pic_URL : String = ""
    init?(id:Int,name:String,type:String,Pic_URL:String)
    {
        self.id = id
        self.name = name
        self.type = type
        self.Pic_URL = Pic_URL
    }
}



