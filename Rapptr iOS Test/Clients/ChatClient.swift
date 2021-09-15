//
//  ChatClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request to fetch chat data used in this app.
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
 *
 */

class ChatClient {
    
    var session = URLSession(configuration: .default)
    
    var task: URLSessionDataTask?
    
    static let shared = ChatClient()

    
    func fetchChatData(completion: @escaping ([Message]) -> Void, error errorHandler: @escaping (String?) -> Void) {
        
        let base = URL(string: "http://dev.rapptrlabs.com/Tests/scripts/chat_log.php")
        
        var messageObjects = [Message]()
        
        guard let url = base else {
            return
        }
        
        task = session.dataTask(with: url) { [weak self] data, response, error in defer {
            self?.task = nil
        }
            if let error = error {
                errorHandler("\(error.localizedDescription)")
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse else {
                return
            }
            
            do {
                switch response.statusCode {
                case 200:
                    let messageJSON = try JSONSerialization.jsonObject(with: data)
                    if let dictionary = messageJSON as? [String: Any],
                                let messages = dictionary["data"] as? [[String: Any]] {
                                DispatchQueue.main.async {
                                    messages.forEach {
                                        let object = Message.init(testName: $0["name"] as! String, withTestMessage: $0["message"] as! String, avatarURL: $0["avatar_url"] as! String)
                                        messageObjects.append(object)
                                    }
                                    completion(messageObjects)
                                }
                            }
                default:
                    errorHandler("error 400")
                }
            } catch {
                errorHandler("error")
            }
        
        
        }
        task?.resume()
    }
}
