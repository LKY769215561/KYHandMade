//
//  KYGuideTool.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/8.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

let KYVersionKey = "curVersion"

class KYCommonTool: NSObject {

    
    class func chooseRootViewController() -> UIViewController {
        
        let currentVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        
        let lastVersion = UserDefaults.standard.object(forKey: KYVersionKey)
        
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = UIScreen.main.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        guard let lastVer  = lastVersion else {
            
            UserDefaults.standard.set(currentVersion, forKey:KYVersionKey)
            return KYNewFeatureController(collectionViewLayout: layout)
        }
        
        if (lastVer as! String) == currentVersion
        {
            return KYAdViewController()
        }else
        {
            UserDefaults.standard.set(currentVersion, forKey:KYVersionKey)
            return KYNewFeatureController(collectionViewLayout: layout)
        }
        
    }
    
   class func openUrl(str:String?) {
        
        guard let urlStr = str else {
            return
        }
        let url = URL(string:urlStr)
    
        guard let url2 = url else {
            return
        }
       UIApplication.shared.openURL(url2)
    }
    
   class  func dataToObj(data:NSData?) -> Any? {
    
        let aa =  try? JSONSerialization.jsonObject(with: data as! Data, options: .mutableContainers)
        return aa

    }
    
    
}



