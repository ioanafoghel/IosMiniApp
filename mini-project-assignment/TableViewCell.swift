//
//  TableViewCell.swift
//  mini-project-assignment
//
//  Created by Ioana Foghel on 4/29/16.
//  Copyright © 2016 Ioana Foghel. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var pubDate: UILabel!
    
    @IBOutlet weak var summary: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
