//
//  Article.swift
//  JSONdemo
//
//  Created by Coditas on 29/03/22.
//

import Foundation

struct Article: Codable{
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAT:String?
    var content:String?
}
