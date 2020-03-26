//
//  EmployeeNetworking.swift
//  ArloTest
//
//  Created by 李祺 on 26/03/2020.
//  Copyright © 2020 Lee. All rights reserved.
//

import Foundation
class EmployeeNetworking{
    func fetchEmployeeInfo(with completion: @escaping (EmployeeData)->Void) {
        if let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees"){
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request){ data, response, error in
                let decoder = JSONDecoder()
                guard let data = data else {
                    return
                }
                do{
                    let value = try decoder.decode(EmployeeData.self, from: data)
                    completion(value)
                }catch let error {
                    print(error.localizedDescription)
                }
            }.resume()
        }
    }
}
