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
    var login:String
    var node_id:String
    var type:String
    var score:Double?
    var image: Image?
    
}
struct Image: Codable{
    var orignal: String?
}
