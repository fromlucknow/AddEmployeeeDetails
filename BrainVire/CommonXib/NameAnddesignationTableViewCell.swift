//
//  nameAnddesignationTableViewCell.swift
//  BrainVire
//
//  Created by Saifur Rahman on 20/12/20.
//

import UIKit

class NameAnddesignationTableViewCell: UITableViewCell {

    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var designationField: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
