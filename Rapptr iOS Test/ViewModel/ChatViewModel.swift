//
//  ChatViewModel.swift
//  Rapptr iOS Test
//
//  Created by nabi jung on 9/13/21.
//

import Foundation

class ChatViewModel: NSObject {
    
    private var chatClient: ChatClient!
    
    private(set) var chatData : [Message]? {
            didSet {
                self.bindChatViewModelToController()
            }
        }
        
        var bindChatViewModelToController : (() -> ()) = {}
        
        override init() {
            super.init()
            self.chatClient =  ChatClient()
            callFuncToGetChatData()
        }
        
        func callFuncToGetChatData() {
            self.chatClient.fetchChatData { messages in
                self.chatData = messages
            } error: { errorString in
                //handle error
            }

        }
}
