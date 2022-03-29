//
//  NewsFeed.swift
//  JSONdemo
//
//  Created by Coditas on 29/03/22.
//

import Foundation

struct NewsFeed: Codable
{
    var status:String = ""
    var totalResults:Int = 0
    var article:[Article]?
    
    
}
