//
//  KYFocusModel.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/16.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYFocusModel: NSObject {

     var iconStr : String?
     var contentImage : String?
     var nameStr : String?
     var contenStr : String?
    
    
    
     init(dict:[String :AnyObject]) {
        super.init()
        setValuesForKeys(dict)
        
    }
     override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
    
}
