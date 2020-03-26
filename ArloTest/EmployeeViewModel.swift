//
//  EmployeeViewModel.swift
//  ArloTest
//
//  Created by 李祺 on 26/03/2020.
//  Copyright © 2020 Lee. All rights reserved.
//

import Foundation

class EmployeeViewModel{
    
    let employeeInfoNetworking: EmployeeNetworking
    var employeeClosure: (()->())?
    var employeeInfo: [Employee]? {
        didSet{
            self.employeeClosure?()
        }
    }
    
    init(employeeNetworking:EmployeeNetworking = EmployeeNetworking() ) {
        self.employeeInfoNetworking = employeeNetworking
    }
    
    func fetchEmployeeInfo() {
        employeeInfoNetworking.fetchEmployeeInfo { employee in
            self.employeeInfo = employee.data
        }
    }
    
    func getEmployeeInfo() -> [Employee]{
        if let employee = self.employeeInfo{
            return employee
        }else{
            return []
        }
    }
    
    func getNumberOfEmployees() -> Int{
        if let employee = self.employeeInfo{
            return employee.count
        }else{
            return 0
        }
    }
}
