//
//  GuesthouseTableViewCell.swift
//  Homework021
//
//  Created by Chun-Yi Lin on 2021/12/21.
//

import UIKit

class GuesthouseTableViewCell: UITableViewCell {

    @IBOutlet weak var guesthouseImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var townLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hostWordsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
