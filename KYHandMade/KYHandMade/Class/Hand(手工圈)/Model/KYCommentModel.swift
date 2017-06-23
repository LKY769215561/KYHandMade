//
//  KYCommentModel.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/23.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYCommentModel: NSObject {

    var uid : String?
    var circle_item_id : String?
    var content : String?
    var add_time : String?
    var Id : String?
    var uname : String?
    var avatar : String?
    
    
    init(dict:[String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
    
}
