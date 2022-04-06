//
//  User.swift
//  AprilSix
//
//  Created by Coditas on 06/04/22.
//

import Foundation


struct Root: Codable {
    
    let items : [Item]
    
}

struct Item: Codable{
    let login, node_id, type:String
}
