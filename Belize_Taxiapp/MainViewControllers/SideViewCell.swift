//
//  SideViewCell.swift
//  Belize_Taxiapp
//
//  Created by SIERRA on 4/4/18.
//  Copyright © 2018 SIERRA. All rights reserved.
//

import UIKit

class SideViewCell: UITableViewCell {
    @IBOutlet weak var cell_image: UIImageView!
    
    @IBOutlet weak var cell_lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
