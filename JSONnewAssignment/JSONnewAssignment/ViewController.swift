//
//  ViewController.swift
//  JSONnewAssignment
//
//  Created by Coditas on 12/04/22.
//

import UIKit
class ViewController: UIViewController,UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet weak var tableView: UITableView!
 
    
    var newlogin: String?
  var y : String?
  @IBOutlet weak var searchBar: UISearchBar!
    var userData = [Items]()
    override func viewDidLoad() {
      super.viewDidLoad()
      
      searchBar.delegate = self
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      y = searchBar.text!
      ParsingJson { data in
        self.userData = data
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return userData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "oneTableViewCell") as! oneTableViewCell
      cell.loginlbl.text = userData[indexPath.row].login
     
      cell.scorelbl.text = "Score: "+String(userData[indexPath.row].score)
      let firstURL = userData[indexPath.row].avatar_url.absoluteString
      let imageUrl = URL(string:firstURL )!
      let imageData = try! Data(contentsOf: imageUrl)
      let image = UIImage(data: imageData)
      cell.image1?.image = image
      cell.isHidden = indexPath.row > 20
      return cell
    }
    func ParsingJson(comletion: @escaping ([Items])->()){
      print(y!)
      let urlstring = "https://api.github.com/search/users?q=\(String(describing: y!))"
      let url = URL(string: urlstring)
      guard url != nil else{
        print("Error")
        return
      }
      let session = URLSession.shared
      let dataTask = session.dataTask(with: url!) { data, response, error in
        if error == nil, data != nil{
          let decoder = JSONDecoder()
          do {
          let ParsingData = try decoder.decode(Myapi.self, from: data!)
            comletion(ParsingData.items)
          }
          catch {
            print(" Error")
              DispatchQueue.main.async(execute: {
             
                  let dialogMessage = UIAlertController(title: "No results ", message: "later ?", preferredStyle: .alert)
                  
                 
                  let ok = UIAlertAction(title: "Search", style: .default, handler: { (action) -> Void in
                      print("Ok button tapped")
                   })
                  
                  
                  dialogMessage.addAction(ok)

                  
                  self.present(dialogMessage, animated: true, completion: nil)
               })
          }
        }
      }
      dataTask.resume()
    }
  }
  struct Myapi : Decodable {
    var total_count : Int
    var items : [Items]
  }
  struct Items : Decodable {
    var avatar_url : URL
    var login : String
    var score : Int
    var url : URL
    var id : Int
    var node_id : String
    var repos_url : URL
    var type : String
  }
