//
//  MaleFemale_TableViewCell.swift
//  BrainVire
//
//  Created by Saifur Rahman on 20/12/20.
//

import UIKit
enum genderIs:String {
    case male
    case female
}
class MaleFemale_TableViewCell: UITableViewCell {

    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    var genderType:genderIs?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if genderType == nil{
            femaleButton.setBackgroundImage(UIImage(systemName: "circle.dashed"), for: .normal)
            maleButton.setBackgroundImage(UIImage(systemName: "circle.dashed"), for: .normal)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func maleTouched(_ sender: UIButton) {
        sender.setBackgroundImage(UIImage(systemName: "circle.dashed.inset.fill"), for: .normal)
        if sender.tag == 0{
            genderType = .male
            femaleButton.setBackgroundImage(UIImage(systemName: "circle.dashed"), for: .normal)
        }else{
            genderType = .female
            maleButton.setBackgroundImage(UIImage(systemName: "circle.dashed"), for: .normal)
        }
    }
}
