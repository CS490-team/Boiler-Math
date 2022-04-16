//
//  DiscussionViewController.swift
//  BoilerMath
//
//  Created by user215336 on 4/15/22.
//

import UIKit
import Parse
import AlamofireImage
import MessageInputBar
class DiscussionViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, MessageInputBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    var posts = [PFObject]()
    var selectedPost: PFObject!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className:"Posts")
        query.includeKeys(["Author", "Comments", "Comments.author"])
        query.limit = 20
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                
                self.tableView.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.section]
        let comments = (post["Comments"] as? [PFObject]) ?? []
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
            
            let user = post["Author"] as! PFUser
            cell.postAuthor.text = user.username
            cell.postContext.text = post["caption"] as? String
            let imageFile = post["image"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            cell.postImage.af.setImage(withURL: url)
            
            return cell
            
        } else if indexPath.row <= comments.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
            let comment = comments[indexPath.row - 1]
            cell.context.text = comment["text"] as! String
            
            let user = comment["Author"] as! PFUser
            
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddCommentCell")!
            return cell
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //self.tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .interactive
        //let center = NotificationCenter.default
        //center.addObserver(self, selector: #selector(keyboardWillBeHidden(note:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
