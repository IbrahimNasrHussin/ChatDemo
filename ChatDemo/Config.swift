//
//  Config.swift
//  ChatDemo
//
//  Created by hema on 2/11/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import Foundation

struct URLs {
    
    //  main URL
    
    static let main = "http://bimtest.ifmdev.space/api/"
    
    //  login URL
    
    static let login = main + "login"
    
    //  contacts URL
    
    static let contacts = main + "chat/yourTeam?token="+Helper.GetApiToken()!
    
    // groups URL
    
    static let groups = main + "chat/getGroups?token="+Helper.GetApiToken()!
    
    // delete group
    
    static let DeleteGroup = main + "ChatGroup/delete?token="+Helper.GetApiToken()!
    
    // create group 
    
    static let CreateGroup = main + "ChatGroup/createGroup?token="+Helper.GetApiToken()!
    
    // rename group
    
    
    // delete group
    
    
    // send message 
    
    static let SendMessage = main + "sendMessage?token="+Helper.GetApiToken()!
    
    
    
    
    
    
    
    
    
    
    
}
