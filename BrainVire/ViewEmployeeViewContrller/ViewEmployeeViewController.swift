//
//  ViewEmployeeViewController.swift
//  BrainVire
//
//  Created by Saifur Rahman on 19/12/20.
//

import UIKit
import CoreData
class ViewEmployeeViewController: UIViewController {
    // MARK: - Variables
    var arrayOfEmployees :[NSManagedObject]?
    
    // MARK: - Outlet
    @IBOutlet weak var viewEmployee_tableView: UITableView!
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        viewEmployee_tableView.tableViewSetupWithViewC(ViewController: self, cellArrayToRegister: [NameAnddesignationTableViewCell.getCellIdentifier()])
        getData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    // MARK: - Fetch From Core Data
    
    func getData(){
        
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "EmployeeDetails")
        
        //3
        do {
            let people = try managedContext.fetch(fetchRequest)
            arrayOfEmployees = []
            arrayOfEmployees = people
            if people.count == 0{
                Alert.showBasic(title: "Sorry !!", message: "No Employees Found", vc: self)
            }
            viewEmployee_tableView.delegate = self
            viewEmployee_tableView.dataSource = self
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}

extension ViewEmployeeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfEmployees!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameAnddesignationTableViewCell") as! NameAnddesignationTableViewCell
        cell.nameField.text =  arrayOfEmployees![indexPath.row].value(forKey:"name") as? String
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vC_to_show = storyboard?.instantiateViewController(withIdentifier: "ViewController")as! ViewController
        vC_to_show.dataToShow = arrayOfEmployees![indexPath.row]
        vC_to_show.hidesBottomBarWhenPushed = true
        vC_to_show.navigationController?.navigationBar.isHidden = false
        self.navigationController?.pushViewController(vC_to_show, animated: true)
        
    }
    
}
