//
//  NetworkManager.swift
//  Dactrofy
//
//  Created by Suvendu Kumar on 25/06/23.
//

import Foundation

final class NetworkManager {
    
    
    static func registerUser(with userData : RegistrationParameters) {
        let parameters = RegistrationParameters(
            name: "Rakeh",
            email: "suvendu1@gmail.com",
            gender: "F",
            practice_frm_month: "10",
            practice_frm_year: "2019"
        )
        
        do {
            let encoder = JSONEncoder()
            let postData = try encoder.encode(parameters)
            
            var request = URLRequest(url: URL(string: "http://199.192.26.248:8000/sap/opu/odata/sap/ZCDS_TEST_REGISTER_CDS/ZCDS_TEST_REGISTER")!, timeoutInterval: Double.infinity)
            request.httpMethod = "POST"
            request.httpBody = postData
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("X", forHTTPHeaderField: "X-Requested-With")
            request.addValue("sap-usercontext=sap-client=001", forHTTPHeaderField: "Cookie")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                if let data = data {
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("Response: \(responseString)")
                    }
                }
            }
            
            task.resume()
            
        } catch {
            print("Error encoding JSON: \(error)")
        }
    }

}


struct RegistrationParameters: Codable {
    let name: String
    let email: String
    let gender: String
    let practice_frm_month: String
    let practice_frm_year: String
}
