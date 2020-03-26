//
//  Model.swift
//  ArloTest
//
//  Created by 李祺 on 26/03/2020.
//  Copyright © 2020 Lee. All rights reserved.
//


import Foundation

import Foundation

// MARK: - Employee
struct EmployeeData: Codable {
    let status: String
    let data: [Employee]
}

// MARK: - Datum
struct Employee: Codable {
    let id, employeeName, employeeSalary, employeeAge: String
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
