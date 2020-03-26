//
//  ViewController.swift
//  ArloTest
//
//  Created by 李祺 on 26/03/2020.
//  Copyright © 2020 Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let employeeViewModel = EmployeeViewModel()
    let cellID = "eCell"
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        employeeViewModel.employeeClosure = { [unowned self] in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        employeeViewModel.fetchEmployeeInfo()
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeViewModel.getNumberOfEmployees()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! EmployeeTVCell
        cell.nameLabel.text = employeeViewModel.getEmployeeInfo()[indexPath.row].employeeName
        cell.ageLabel.text = employeeViewModel.getEmployeeInfo()[indexPath.row].employeeAge
        
        return cell
    }
}

