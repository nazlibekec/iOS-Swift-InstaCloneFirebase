//
//  FeedViewController.swift
//  InstaCloneFirebase
//
//  Created by Nazlı Bekeç on 6.03.2023.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.userEmailLabel.text = "userName"
        cell.likeLabel.text = "0"
        cell.commentLabel.text = "comment"
        cell.userImageView.image = UIImage(named: "selectImage")
        cell.profileImageView.image = UIImage(named: "profile")
        return cell
        
    }
}
