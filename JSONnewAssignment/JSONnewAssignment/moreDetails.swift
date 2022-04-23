//
//  moreDetails.swift
//  JSONnewAssignment
//
//  Created by Coditas on 23/04/22.
//

import UIKit

class userDetail: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userId: UILabel!
    
    
    @IBOutlet weak var nodeId: UILabel!
    
    @IBOutlet weak var repoURL: UILabel!
    
    @IBOutlet weak var accURL: UILabel!
    
    
    
    @IBOutlet weak var accType: UILabel!
    
    var moreItems: Items?
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userImage.layer.cornerRadius = userImage.frame.size.height/2
        
        let idnew = moreItems?.id
        userId.text = String(describing: idnew!)
        
        nodeId.text = moreItems?.node_id
        
        
        
        userName.text = moreItems?.login
       
        let urlacc = moreItems?.url
        accURL.text = (String(describing:urlacc!))
        
        let urlrepo = moreItems?.repos_url
        repoURL.text = (String(describing:urlrepo!))
        
        accType.text = moreItems?.type
        
        let imageUrl = moreItems?.avatar_url
        let imageData = try! Data(contentsOf: imageUrl!)
        let image = UIImage(data: imageData)
        userImage.image = image
        
        
        
  
    }
    

}
