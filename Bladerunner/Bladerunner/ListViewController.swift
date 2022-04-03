//
//  ListViewController.swift
//  Bladerunner
//
//  Created by Coditas on 02/04/22.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    var items = Items()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        items.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        
    }


    @IBAction func segmentPressed(_ sender: UISegmentedControl) {
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.itemsArray.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items.itemsArray[indexPath.row].Items.login
        return cell
    }
    
    
}
