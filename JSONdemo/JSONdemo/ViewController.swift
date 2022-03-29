//
//  ViewController.swift
//  JSONdemo
//
//  Created by Coditas on 29/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY"
        
        let url = URL(string: urlString)
        
        guard url != nil else{
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil{
                
                let decoder = JSONDecoder()
                
                do {
                
                
                let newsFeed = try decoder.decode(NewsFeed.self, from: data!)
                    
                    print(newsFeed)
                
            }
                catch{
                    print("Error in JSON parsing")
                }
        }
        }
        dataTask.resume()

    }


}

