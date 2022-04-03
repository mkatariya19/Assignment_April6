//
//  detailViewController.swift
//  Bladerunner
//
//  Created by Coditas on 04/04/22.
//

import UIKit

class detailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var repoLabel: UILabel!
    
    @IBOutlet weak var descripLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var langLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    var items: Items!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
