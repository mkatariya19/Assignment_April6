//
//  ViewController.swift
//  JSONnewAssignment
//
//  Created by Coditas on 12/04/22.
//

import UIKit
class ViewController: UIViewController,UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet weak var tableView: UITableView!
 
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
          let ParsingData = try decoder.decode(Gitapi.self, from: data!)
            comletion(ParsingData.items)
          }
          catch {
            print("Parsing Error")
          }
        }
      }
      dataTask.resume()
    }
  }
  struct Gitapi : Decodable {
    var total_count : Int
    var items : [Items]
  }
  struct Items : Decodable {
    var avatar_url : URL
    var login : String
    var score : Int
    var url : URL
  }
