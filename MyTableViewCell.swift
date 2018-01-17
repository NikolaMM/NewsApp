//
//  MyTableViewCell.swift
//  news
//
//  Created by Nikola Milenkovic on 4/5/17.
//  Copyright © 2017 Nikola Milenkovic. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var slika: UIImageView!
    @IBOutlet weak var labela: UILabel!
}
