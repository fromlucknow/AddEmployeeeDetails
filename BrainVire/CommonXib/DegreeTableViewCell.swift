//
//  DegreeTableViewCell.swift
//  BrainVire
//
//  Created by Saifur Rahman on 20/12/20.
//
enum degreetype:String {
    case bachelor
    case master
    case mPhil
    case pHD
}
import UIKit

class DegreeTableViewCell: UITableViewCell {

    @IBOutlet weak var PhdButton: UIButton!
    @IBOutlet weak var mPhilButton: UIButton!
    @IBOutlet weak var masterButton: UIButton!
    @IBOutlet weak var bachelorButton: UIButton!
    var degreeSelectedIs:degreetype?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if degreeSelectedIs == nil{
            PhdButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
            mPhilButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
            masterButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
            bachelorButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func actionForDegreeSelected(_ sender: UIButton) {
        PhdButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        mPhilButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        masterButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        bachelorButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        sender.setBackgroundImage(UIImage(systemName: "square.fill"), for: .normal)
        if sender.tag == 0 {
            degreeSelectedIs = .bachelor
        }else if sender.tag == 1 {
            degreeSelectedIs = .master
        }else if sender.tag == 0 {
            degreeSelectedIs = .mPhil
        }else if sender.tag == 0 {
            degreeSelectedIs = .pHD
        }
        
    }
    
}
