//
//  AppDelegate.swift
//  PassingData
//
//  Created by clarknt on 2019-11-19.
//  Copyright © 2019 clarknt. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        if #available(iOS 13, *) { } else {
            // create the main navigation controller to be used for our app
            let navController = UINavigationController()

            // send that into our coordinator so that it can display view controllers
            coordinator = MainCoordinator(navigationController: navController)

            // tell the coordinator to take over control
            coordinator?.start()

            // create a basic UIWindow and activate it
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = navController
            window?.makeKeyAndVisible()
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

