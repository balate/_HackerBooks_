//
//  BookCellViewCell.swift
//  HackerBooks
//
//  Created by Javier Contreras on 1/2/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

import UIKit

class BookCellViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!

    @IBOutlet weak var titleCell: UILabel!
    
    @IBOutlet weak var authorCell: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
