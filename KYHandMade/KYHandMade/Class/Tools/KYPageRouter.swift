//
//  KYPageRouter.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/14.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYPageRouter: NSObject {

   class func getCurrentNav() -> UINavigationController? {
        return  getRootVC().selectedViewController as! KYNavgationController
    }
    
   class func getRootVC() -> UITabBarController {
        return  APP.window?.rootViewController as! KYTabBarController
   }
    
    class func getCurrentVC() -> UIViewController {
        
        let current = getCurrentNav()
        return (current?.viewControllers.last!)!
    }
    
    class func openAuthorWebView(webURL : String) {
         let animator = XWCoolAnimator.xw_animator(with: .explode)
         let webVC = KYWebViewController()
         webVC.isPush = false
         webVC.webView.webView.loadRequest(URLRequest(url:URL(string:webURL)!))
         getCurrentVC().xw_present(webVC, with: animator)
    }
    
}
