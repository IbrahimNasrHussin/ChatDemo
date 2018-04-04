//
//  StringAndExtinsions.swift
//  ChatDemo
//
//  Created by hema on 2/11/18.
//  Copyright © 2018 UDAAR. All rights reserved.
//

import Foundation

extension String
{
    var trimmed: String
        {
            return self.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    
}
