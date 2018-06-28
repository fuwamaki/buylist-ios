//
//  AppDelegate.swift
//  BuyList
//
//  Created by 牧 宥作 on 2017/06/02.
//  Copyright © 2017年 牧 宥作. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate:UIResponder,UIApplicationDelegate {

    var window:UIWindow?
    let homeScreenQuickAction = HomeScreenQuickAction()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {//アプリ起動時
        homeScreenQuickAction.createHomeScreenQuickAction()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {//アプリ閉じそうな時
    }

    func applicationDidEnterBackground(_ application: UIApplication) {//アプリ閉じた時
    }

    func applicationWillEnterForeground(_ application: UIApplication) {//アプリ開きそうな時
    }

    func applicationDidBecomeActive(_ application: UIApplication) {//アプリ開いた時
    }

    func applicationWillTerminate(_ application: UIApplication) {//タスクキル時
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {//QuickAction起動時
        let handleShortCutItem = homeScreenQuickAction.handleShortCutItem(shortcutItem: shortcutItem)
        completionHandler(handleShortCutItem.0)
        
        if let tabVC = UIApplication.shared.keyWindow?.rootViewController as? UITabBarController {
            tabVC.selectedIndex = 2
        }
        // TODO: tabbarが消えちゃう問題の改修
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let settingView = storyboard.instantiateViewController(withIdentifier: handleShortCutItem.1)
        self.window?.rootViewController = settingView
        self.window?.makeKeyAndVisible()
    }

}

