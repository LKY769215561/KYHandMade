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
    
    
}