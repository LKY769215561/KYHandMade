//
//  KYFariHotDataModel.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/28.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYFariHotDataModel: NSObject {

    var  name : String?
    var  hot_type : String?
    var  pic : String?
    var  special_id : String?
    var  template : String?
    
    init(dict:[String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
