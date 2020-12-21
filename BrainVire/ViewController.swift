//
//  ViewController.swift
//  BrainVire
//
//  Created by Saifur Rahman on 19/12/20.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    @IBOutlet weak var detail_tableView: UITableView!
    var dataToShow : NSManagedObject?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        detail_tableView.tableViewSetupWithViewC(ViewController: self, cellArrayToRegister: [Show_detailsTableViewCell.getCellIdentifier()])
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Show_detailsTableViewCell") as! Show_detailsTableViewCell
        if indexPath.row == 0{
            cell.labelType.text = "Name"
            cell.labelValue.text = dataToShow?.value(forKey: "name") as? String
        }
        else if indexPath.row == 1 {
            cell.labelType.text = "Designation"
            cell.labelValue.text = dataToShow?.value(forKey: "designation") as? String
        }
            else if indexPath.row ==  2{
                cell.labelType.text = "Mobile"
                cell.labelValue.text = dataToShow?.value(forKey: "mobile") as? String
        }
                else if indexPath.row ==  3{
                    cell.labelType.text = "Email Address"
                    cell.labelValue.text = dataToShow?.value(forKey: "email") as? String
                }
                    else if indexPath.row ==  4{
                        cell.labelType.text = "City"
                        cell.labelValue.text = dataToShow?.value(forKey: "city") as? String
                }
                        else if indexPath.row ==  5{
                            cell.labelType.text = "Gender"
                            cell.labelValue.text = dataToShow?.value(forKey: "gender") as? String
                        }
                            else{
                                cell.labelType.text = "Last Qualification"
                                cell.labelValue.text = dataToShow?.value(forKey: "degree") as? String
                        }
        return cell
    }
    
    
}
