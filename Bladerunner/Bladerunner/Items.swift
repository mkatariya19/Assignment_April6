//
//  Items.swift
//  Bladerunner
//
//  Created by Coditas on 02/04/22.
//

import Foundation

class Items {
    
    struct Returned: Codable {
        
        var Items: Items
        
       // var score = Double
    }
    
    
    
    var urlString = "https://api.github.com/search/users?q=search_string_here"
    var itemsArray: [Returned] = []
    
    func getData(completed: @escaping ()->()) {
        
        print(" accessing the url \(urlString)")
        
        guard let url = URL(string: urlString) else{ 
            print("No results found \(urlString)")
            completed()
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription) ")

                
            }
            
            do {
                
                self.itemsArray = try JSONDecoder().decode([Returned].self, from: data!)
                
                
                print("Here is what we returned \(self.itemsArray)")
                
            }
            catch {
                print("JSON ERROR: \(error.localizedDescription) ")

                
            }
        }
        task.resume()
    }
}
