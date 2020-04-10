//
//  AppDelegate.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/8.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        window = UIWindow(frame:UIScreen.main.bounds)
        window?.rootViewController = KYCommonTool.chooseRootViewController()
        configApper()
        window?.makeKeyAndVisible()
        
        KYProgressHUD.setUPHUD()
        
        return true
    }


    func configApper() {
        
        let appearance = UINavigationBar.appearance()
        
        let textAttrs : [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)
        ]
        appearance.titleTextAttributes = textAttrs
        
        
    }
    


}

