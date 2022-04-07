//
//  DetailViewController.swift
//  AprilSix
//
//  Created by Coditas on 08/04/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var nodeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var items: Root!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        guard items != nil else {
            print("Never happen!")
            return
        }
        updateUserInterface()
        
    }
    
    func updateUserInterface() {
        
    }


}
