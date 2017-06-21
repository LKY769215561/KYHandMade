//
//  KYDaRenStepModel.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/21.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYDaRenStepModel: NSObject {
     var pic : String?
     var pic_s : String?
     var content : String?
    
    init(dict:[String :AnyObject]) {
        super.init()
        setValuesForKeys(dict)
        
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
