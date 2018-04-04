//
//  MessageModel.swift
//  ChatDemo
//
//  Created by hema on 3/31/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import Foundation
import JSQMessagesViewController

enum MessageModelStatus {
    case sending
    case sent
    case delivered
}

class MessageModel: JSQMessage {
    var status : MessageModelStatus
    var id : Int
    
    public init!(senderId: Int, status: MessageModelStatus, displayName: String, text: String, id: Int?) {
        self.status = status
        
        if (id != nil) {
            self.id = id!
        } else {
            self.id = 0
        }
        
        
        
        super.init(senderId: senderId, senderDisplayName: displayName, date: Date.init(), text: text)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

