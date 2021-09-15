//
//  LoginClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request here to login.
 *
 * 2) Using the following endpoint, make a request to login
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/login.php
 *
 * 3) Don't forget, the endpoint takes two parameters 'email' and 'password'
 *
 * 4) email - info@rapptrlabs.com
 *   password - Test123
 *
*/

class LoginClient {
    
    var session: URLSession?
    
    func login(email: String, password: String, completion: @escaping (String) -> Void, error errorHandler: @escaping (String?) -> Void) {
        
        let base = URL(string: "http://dev.rapptrlabs.com/Tests/scripts/login.php?email=\(email)&password=\(password)")
        
        guard let url = base else {
            return
        }
        
        let task = session?.dataTask(with: url) { data, response, error in DispatchQueue.main.async {
            
            if let error = error {
                errorHandler("error with task")
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse else {
                return
            }
            
            do {
                switch response.statusCode {
                case 200:
                    let loginJSON = try JSONSerialization.jsonObject(with: data)
                    print(loginJSON)
//                    if let dictionary = loginJSON as? [String: Any],
//                                let results = dictionary["results"] as? [[String: Any]] {
//                                DispatchQueue.main.async {
//                                    results.forEach { print($0["body"] ?? "", terminator: "\n\n") }
//                                }
//                            }
                default:
                    errorHandler("error 400")
                }
            } catch {
                errorHandler("error")
            }
            
        }
        
        }
        task?.resume()
        
    }
}
