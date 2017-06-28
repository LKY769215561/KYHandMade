//
//  KYTabBarController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/12.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit



let kClassKey  = "rootVCClassString"
let kTitleKey  = "title"
let kImgKey    = "imageName"
let kSelImgKey = "selectedImageName"

class KYTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let childItemsArray  = [
        
        [kClassKey  : "KYHomController",
        kTitleKey  : "首页",
        kImgKey    : "icon_jiaocheng_",
        kSelImgKey : "icon_jiaocheng_s"],

        
        [kClassKey  : "KYTutorialTableViewController",
        kTitleKey  : "教程",
        kImgKey    : "icon_ketang_",
        kSelImgKey : "icon_ketang_s"],
        
        [kClassKey  : "KYHandController",
        kTitleKey  : "手工圈",
        kImgKey    : "icon_shougongquan_",
        kSelImgKey : "icon_shougongquan_s"],
        
        [kClassKey  : "KYFairTableViewController",
        kTitleKey  : "市集",
        kImgKey    : "icon_shiji_",
        kSelImgKey : "icon_shiji_s"],
        
        [kClassKey  : "KYMyTableViewController",
        kTitleKey  : "我的",
        kImgKey    : "icon_wode_",
        kSelImgKey : "icon_wode_s"]
            
        ]
        
        for  dict in childItemsArray {
        
            
            let className = dict[kClassKey]!
            let appName = Bundle.main.infoDictionary?["CFBundleName"] as! String
            
            let classStringName = "\(appName).\(className)"
            
            let classType = NSClassFromString(classStringName) as? UIViewController.Type
            guard let type = classType else {
                continue
            }
            let childVC = type.init()
            let nav = KYNavgationController(rootViewController: childVC)
            
            let title = dict[kTitleKey]
            let image = UIImage(named : dict[kImgKey]!)
            let selImage = UIImage(named : dict[kSelImgKey]!)
            let item = UITabBarItem(title: title, image:image, selectedImage:selImage)
            item.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.orange], for: .selected)
            // 设置底部tabbar 字体
            nav.tabBarItem = item
            addChildViewController(nav)
            
        }
        
        
    }

}
