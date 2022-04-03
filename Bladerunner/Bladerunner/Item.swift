//
//  Item.swift
//  Bladerunner
//
//  Created by Coditas on 04/04/22.
//

import Foundation
 struct Items: Codable {
    var login: String
    var Repository_name: String?
    var Repository_des: String?
    var Repository_url: String?
    var Language: String?
    var image: Image?
}
struct Image: Codable{
    var orignal: String?
    
}
 
