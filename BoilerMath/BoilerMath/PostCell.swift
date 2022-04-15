//
//  PostCell.swift
//  BoilerMath
//
//  Created by user215336 on 4/15/22.
//

import UIKit

class PostCell: UITableViewCell {
    var contoller:UIViewController!

    @IBOutlet weak var postTitle: UILabel!
    
    @IBOutlet weak var postAuthor: UILabel!
    @IBOutlet weak var postContext: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
