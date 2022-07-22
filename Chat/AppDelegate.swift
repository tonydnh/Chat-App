//
//  AppDelegate.swift
//  Chat
//
//  Created by Tony Dinh on 7/21/22.
//

import Foundation
import UIKit
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
      [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
      FirebaseApp.configure()

    return true
  }
}
