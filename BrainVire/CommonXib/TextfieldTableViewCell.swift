//
//  TextfieldTableViewCell.swift
//  BrainVire
//
//  Created by Saifur Rahman on 19/12/20.
//

import UIKit
import AVFoundation
class TextfieldTableViewCell: UITableViewCell {

  
    @IBOutlet weak var dropdownButton: UIButton!
    
    @IBOutlet weak var textfieldorFormCell: Designabletextfield!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
