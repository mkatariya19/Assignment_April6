//
//  Parser.swift
//  AprilSix
//
//  Created by Coditas on 06/04/22.
//

import Foundation

struct Parser{
    
    func parse(comp : @escaping ([Item])->()) {
        
        let api = URL(string: "https://api.github.com/search/users?q=manish")
        
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            
            if error != nil{
                print(error?.localizedDescription)
                return
            }
            
            do{
            
           let result = try JSONDecoder().decode(Root.self, from: data!)
                comp(result.items)
            
        }
            catch{
                
            }
        }.resume()
}
  
}
