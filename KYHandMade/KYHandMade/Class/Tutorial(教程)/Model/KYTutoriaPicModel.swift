//
//  KYTutoriaPicData.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/20.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYTutoriaPicModel: NSObject {

    var hand_id : String?
    var host_pic_color : String?
    var bg_color : String?
    var collect : String?
    var subject : String?
    var view : String?
    var user_id : String?
    var host_pic : String?
    var user_name : String?
    var last_id : String?
    
    
    init(dict:[String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
