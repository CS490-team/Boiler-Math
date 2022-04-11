//
//  examCell.swift
//  BoilerMath
//
//  Created by 吴承翔 on 4/10/22.
//

import UIKit

class examCell: UITableViewCell {

    var version=[String:Any]()
    var url:String!
    var contoller:UIViewController!
    @IBOutlet weak var examname: UILabel!
    
    
    @IBOutlet weak var examdate: UILabel!
    
    @IBOutlet weak var examversion: UILabel!
    
    @IBOutlet weak var likebutton: UIButton!
    
    @IBOutlet weak var completebutton: UIButton!
    
    @IBAction func likeaction(_ sender: Any) {
    }
    @IBAction func completeaction(_ sender: Any) {
    }
    @IBAction func exambutton(_ sender:Any) {
        if let url = version["Exam"] {
            // now val is not nil and the Optional has been unwrapped, so use it
            UIApplication.shared.openURL(URL(string: url as! String)!)
        } else {
            let alert = UIAlertController(title: "Error", message: "No File in the Database, please try other buttons", preferredStyle: .alert)
                    let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(OK)
                    contoller.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func keybutton(_ sender: Any) {
        if let url = version["Ans"] {
            // now val is not nil and the Optional has been unwrapped, so use it
            UIApplication.shared.openURL(URL(string: url as! String)!)
        } else {
            let alert = UIAlertController(title: "Error", message: "No File in the Database, please try other buttons", preferredStyle: .alert)
                    let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(OK)
                    contoller.present(alert, animated: true, completion: nil)        }
    }
    @IBAction func solbutton(_ sender: Any) {
        if let url = version["Sol"] {
            // now val is not nil and the Optional has been unwrapped, so use it
            UIApplication.shared.openURL(URL(string: url as! String)!)
        } else {
            let alert = UIAlertController(title: "Error", message: "No File in the Database, please try other buttons", preferredStyle: .alert)
                    let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(OK)
                    contoller.present(alert, animated: true, completion: nil)        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state}
    }
}
