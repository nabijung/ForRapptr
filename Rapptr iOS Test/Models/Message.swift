//
//  Message.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

/*
 I wasn't able to get the model to work with the avatar URL as a URL and not a String, so I switched it.
*/

struct Message {
    var userID: Int
    var username: String
    var avatarURL: String?
    var text: String
    
    init(userID: String, testName: String, withTestMessage message: String, avatarURL: String?) {
        self.userID = Int(userID) ?? 0
        self.username = testName
        self.avatarURL = avatarURL ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Smiley.svg/220px-Smiley.svg.png"
        self.text = message
    }
}
