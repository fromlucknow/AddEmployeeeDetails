//
//  AddEmployeeViewController.swift
//  BrainVire
//
//  Created by Saifur Rahman on 19/12/20.
//

import UIKit
import CoreData
class AddEmployeeViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var addEmployeTableView: UITableView!
    // MARK: - Variables
    var cityArray = ["LA", "Mexico","Mumbai","Bahama"]
    var hiddenRow = true
    var employee_DetailsTuple = (name:"",designation:"",mobile:"",mail:"",city:"Select City",gender:"",degree:"").self
    var placeholderText = ["Employee Name","Employee designation","Employee mobile number","Employee email address"]
    override func viewDidLoad() {
        super.viewDidLoad()
        addEmployeTableView.tableViewSetupWithViewC(ViewController: self, cellArrayToRegister: [TextfieldTableViewCell.getCellIdentifier(),MaleFemale_TableViewCell.getCellIdentifier(),DegreeTableViewCell.getCellIdentifier(),SingleButtonTableViewCell.getCellIdentifier()])
        
        // Do any additional setup after loading the view.
    }
    @objc func endEditing(_ sender :UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    
    // MARK: - Navigation
    @objc func subMitCalled(){
        self.view.endEditing(true)
        validate()
        print(employee_DetailsTuple)
    }
    func validate(){
        if employee_DetailsTuple.name.trimmingCharacters(in: .whitespaces).isEmpty{
            Alert.showBasic(title: "Empty Credentials", message: "Name field is empty", vc: self)
        }else if employee_DetailsTuple.designation.trimmingCharacters(in: .whitespaces).isEmpty{
            Alert.showBasic(title: "Empty Credentials", message: "Designation field is empty", vc: self)
        }else if employee_DetailsTuple.mobile.trimmingCharacters(in: .whitespaces).count < 10{
            Alert.showBasic(title: "Empty Credentials", message: "Enter a valid mobile number", vc: self)
        }else if !employee_DetailsTuple.mail.emailValidation(){
            Alert.showBasic(title: "Empty Credentials", message: "Enter a valid email", vc: self)
        }else if employee_DetailsTuple.city == "Select City"{
            Alert.showBasic(title: "Empty Credentials", message: "Please select your city", vc: self)
        }else {
            let gender_cell = addEmployeTableView.cellForRow(at: IndexPath(row: 0, section: 2)) as! MaleFemale_TableViewCell
            if let _ = gender_cell.genderType{
                employee_DetailsTuple.gender = gender_cell.genderType!.rawValue
                let degree_cell = addEmployeTableView.cellForRow(at: IndexPath(row: 1, section: 2)) as! DegreeTableViewCell
                if let _ = degree_cell.degreeSelectedIs{
                    employee_DetailsTuple.degree = degree_cell.degreeSelectedIs!.rawValue
                    
                    degree_cell.PhdButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
                    degree_cell.mPhilButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
                    degree_cell.masterButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
                    degree_cell.bachelorButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
                    degree_cell.degreeSelectedIs = nil
                    gender_cell.femaleButton.setBackgroundImage(UIImage(systemName: "circle.dashed"), for: .normal)
                    gender_cell.maleButton.setBackgroundImage(UIImage(systemName: "circle.dashed"), for: .normal)
                    gender_cell.genderType = nil
                    save_Data()
                }else{
                    Alert.showBasic(title: "Error", message: "Please select your last qualification !", vc: self)
                    return
                }
                
                
            }else{
                Alert.showBasic(title: "Error", message: "Please select your gender !", vc: self)
                return
            }
            
            
            
        }
        
        
    }
    func save_Data(){
        
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let entity =
            NSEntityDescription.entity(forEntityName: "EmployeeDetails",
                                       in: managedContext)!
        
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        person.setValue(employee_DetailsTuple.name, forKeyPath: "name")
        person.setValue(employee_DetailsTuple.city, forKeyPath: "city")
        person.setValue(employee_DetailsTuple.designation, forKeyPath: "designation")
        person.setValue(employee_DetailsTuple.mail, forKeyPath: "email")
        person.setValue(employee_DetailsTuple.mobile, forKeyPath: "mobile")
        person.setValue(employee_DetailsTuple.degree, forKeyPath: "degree")
        person.setValue(employee_DetailsTuple.gender, forKeyPath: "gender")
        
        do {
            try managedContext.save()
            employee_DetailsTuple.name = ""
            employee_DetailsTuple.city = "Select City"
            employee_DetailsTuple.designation = ""
            employee_DetailsTuple.mail = ""
            employee_DetailsTuple.mobile = ""
            employee_DetailsTuple.gender = ""
            employee_DetailsTuple.degree = ""
            Alert.showBasic(title: "Saved Successfully", message: "Employee Details have been saved successfully !!", vc: self)
            addEmployeTableView.reloadData()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
// MARK: - TableView Delegate Methods
extension AddEmployeeViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }else if section == 1{
            if hiddenRow == false{
                return cityArray.count + 1
            }else{
                return 1
            }
        }else{
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextfieldTableViewCell") as! TextfieldTableViewCell
            cell.textfieldorFormCell.isUserInteractionEnabled = true
            cell.textfieldorFormCell.placeholder = placeholderText[indexPath.row]
            cell.textfieldorFormCell.tag = indexPath.row
            cell.textfieldorFormCell.delegate = self
            if indexPath.row ==  0{
                cell.textfieldorFormCell.text = employee_DetailsTuple.name
                
            }else if indexPath.row == 1{
                cell.textfieldorFormCell.text =  employee_DetailsTuple.designation
            }
            else if indexPath.row == 2{
                cell.textfieldorFormCell.text = employee_DetailsTuple.mobile
                cell.textfieldorFormCell.keyboardType = .numberPad
            }
            else if indexPath.row == 3{
                cell.textfieldorFormCell.text =  employee_DetailsTuple.mail
                cell.textfieldorFormCell.keyboardType = .emailAddress
                
            }
            return cell
        }
        else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextfieldTableViewCell") as! TextfieldTableViewCell
            cell.textfieldorFormCell.placeholder = "Select City"
            cell.textfieldorFormCell.text = employee_DetailsTuple.city
            cell.textfieldorFormCell.isUserInteractionEnabled = false
            
            if indexPath.row == 0 {

                cell.dropdownButton.isHidden = false
                if hiddenRow == true{
                    cell.dropdownButton.setBackgroundImage(UIImage(systemName: "chevron.down.circle.fill"), for: .normal)
                }else{
                    cell.dropdownButton.setBackgroundImage(UIImage(systemName: "chevron.down.circle.fill"), for: .normal)
                    
                }
            }else{
                cell.dropdownButton.isHidden = true
                cell.textfieldorFormCell.text = cityArray[indexPath.row - 1]
            }
            return cell
        }else{
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "MaleFemale_TableViewCell") as! MaleFemale_TableViewCell
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing(_:))))
                return cell
            }else if indexPath.row == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DegreeTableViewCell") as! DegreeTableViewCell
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing(_:))))

                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "SingleButtonTableViewCell") as! SingleButtonTableViewCell
                cell.submitButton.addTarget(self, action: #selector(subMitCalled), for: .touchUpInside)
                return cell
            }
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1{
            self.view.endEditing(true)
            if hiddenRow == true{
                hiddenRow = false
                addEmployeTableView.reloadSections(IndexSet(integer: 1), with: .automatic)
            }else{
                if indexPath.row != 0{
                    employee_DetailsTuple.city = cityArray[indexPath.row - 1]
                }
                hiddenRow = true
                addEmployeTableView.reloadSections(IndexSet(integer: 1), with: .automatic)
            }
        }
    }
    
}
extension AddEmployeeViewController:UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !textField.text!.isEmpty{
            if textField.tag == 0{
                employee_DetailsTuple.name = textField.text!
                
            }else if textField.tag == 1{
                employee_DetailsTuple.designation = textField.text!
            }
            else if textField.tag == 2{
                employee_DetailsTuple.mobile = textField.text!
            }
            else if textField.tag == 3{
                employee_DetailsTuple.mail = textField.text!
            }
            else if textField.tag == 4{
                
            }
        }
    }
}
