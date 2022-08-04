//
//  AppDelegate.swift
//  MEM
//
//  Created by Ehtisham Khalid on 25.07.22.
//

import UIKit
import FirebaseCore
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /// Main Screen
        let SB = UIStoryboard(name: "Main", bundle: nil)
        let vc = SB.instantiateViewController(withIdentifier: "WelcomeVC") as! WelcomeVC
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = vc
        
        /// Firebase Configure
        FirebaseApp.configure()
        
        /// UI Setup
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableDebugging = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        UISearchBar.appearance().tintColor = UIColor(hexString: "#424242")
        UITextField.appearance().tintColor = UIColor(hexString: "#c5c5c5")
        
        UITextField.appearance().tintColor = .black
        
        SessionManager.instance.loginData()
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

