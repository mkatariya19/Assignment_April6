//
//  ViewController.swift
//  AprilSix
//
//  Created by Coditas on 06/04/22.
//

import UIKit

class ViewController: UIViewController {
    
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
            }
            
        }
        tableView.dataSource = self
        // Do any additional setup after loading the view.
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
        let image = UIImageView()
        cell.imageView?.image = image
        return cell
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DetailViewController
        let selectedIndexPath = tableView.indexPathForSelectedRow!
        destination?.items = Item.Array[selectedIndexPath.row].items
        
    }
    
}

