//
//  ItemProductoTableViewCell.swift
//  DAMII-CL3-Villegas_Galvan_Brandon
//
//  Created by VGBrandon on 6/24/23.
//  Copyright © 2023 VGBrandon. All rights reserved.
//

import UIKit

class ItemProductoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblTITLE: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
}
