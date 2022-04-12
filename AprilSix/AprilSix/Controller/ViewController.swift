//
//  ViewController.swift
//  AprilSix
//
//  Created by Coditas on 06/04/22.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
   
    
    let parser = Parser()
    
    var items = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        parser.parse{
            data in
            self.items = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.searchBar()
            }
            
        }
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func searchBar() {
        
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        searchBar.delegate = self
        searchBar.showsScopeBar = true
        searchBar.tintColor = UIColor.lightGray
        searchBar.scopeButtonTitles = ["login",  "node_id"]
        self.tableView.tableHeaderView = searchBar
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            
            
        }
    }


}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].login
        
        
        
        if let score = items[indexPath.row].score
            {
            cell.detailTextLabel?.text = "\(score)"
        } else{
            cell.detailTextLabel?.text = "-"
        }
        return cell
        
        
    }
    
}

