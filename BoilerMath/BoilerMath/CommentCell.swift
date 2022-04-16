//
//  CommentCell.swift
//  BoilerMath
//
//  Created by user215336 on 4/15/22.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var context: UILabel!
    @IBOutlet weak var Author: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
