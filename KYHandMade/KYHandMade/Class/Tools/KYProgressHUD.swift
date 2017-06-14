//
//  KYProgressHUD.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/13.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit
import SVProgressHUD

class KYProgressHUD: NSObject {

   class func setUPHUD() {
        
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.setBackgroundColor(UIColor(white:0.0,alpha:0.8))
        SVProgressHUD.setFont(UIFont.boldSystemFont(ofSize: 16))
        SVProgressHUD.setMinimumDismissTimeInterval(1.5)
        
    }
    
    
    class func show() {
        SVProgressHUD.show()
    }
    
    class func showWithStatus(_ status: String) {
        SVProgressHUD.show(withStatus: status)
    }
    
    class func showInfoWithStatus(_ status: String) {
        SVProgressHUD.showInfo(withStatus: status)
    }
    
    class func showSuccessWithStatus(_ status: String) {
        SVProgressHUD.showSuccess(withStatus: status)
    }
    
    class func showErrorWithStatus(_ status: String) {
        SVProgressHUD.showError(withStatus: status)
    }
    
    class func dismiss() {
        SVProgressHUD.dismiss()
    }
    
}
