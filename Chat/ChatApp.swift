//
//  ChatApp.swift
//  Chat
//
//  Created by Tony Dinh on 7/21/22.
//

import SwiftUI

@main
struct ChatApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
