//
//  courseCell.swift
//  BoilerMath
//
//  Created by 吴承翔 on 4/10/22.
//

import UIKit

class courseCell: UITableViewCell {

    @IBOutlet weak var CourseNameLabel: UILabel!
    @IBOutlet weak var CourseDescriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
