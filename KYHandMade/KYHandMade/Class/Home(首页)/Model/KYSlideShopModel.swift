

//
//  KYSlideShopModel.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/19.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYSlideShopModel: NSObject {

     var subject : String?
     var host_pic : String?
     var avatar : String?
     var uname : String?
     var votes : String?
     var last_id : String?
     var circle_item_id : String?
    
    init(dict:[String :AnyObject]) {
        super.init()
        setValuesForKeys(dict)
        
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
