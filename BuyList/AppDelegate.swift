//
//  AppDelegate.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/06/02.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let homeScreenQuickAction = HomeScreenQuickAction()

    // when open app
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        homeScreenQuickAction.createHomeScreenQuickAction()
        return true
    }

    // when before close app
    func applicationWillResignActive(_ application: UIApplication) {
    }

    // when app close
    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    // when before open app
    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    // when open app
    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    // when task kill
    func applicationWillTerminate(_ application: UIApplication) {
    }

    // starting quick action
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let handleShortCutItem = homeScreenQuickAction.handleShortCutItem(shortcutItem: shortcutItem)
        completionHandler(handleShortCutItem.0)

        if let tabVC = UIApplication.shared.keyWindow?.rootViewController as? UITabBarController {
            tabVC.selectedIndex = 2
        }
        // TODO: quick action でアプリ起動するとtabbarが消える問題の対応
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let settingView = storyboard.instantiateViewController(withIdentifier: handleShortCutItem.1)
        self.window?.rootViewController = settingView
        self.window?.makeKeyAndVisible()
    }
}
