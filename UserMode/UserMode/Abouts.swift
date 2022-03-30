//
//  Abouts.swift
//  UserMode
//
//  Created by Coditas on 30/03/22.
//

import Foundation

class Abouts {
    
    struct Returned = Codable {
        
        var message:String?
        var error:String? = [
        
            var resouce:String?,
            var myfield:String?,
                var mycode:String?
                
            
        ]
    }
    
    var urlString = "https://api.github.com/search/users?q=search_string_here"
    
    func getData(completed: @escaping ()->()) {
        
        print("We are accessing the url \(urlString)")
        
        guard let url = URL(string: urlString) else {
            
            print("ERROR: could not create a URL from \(urlString)")
            completed()
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error  in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            do{
                
            }
            catch{
                print("JSON ERROR: \(error.localizedDescription)")
                
            }
        }
    }
}
