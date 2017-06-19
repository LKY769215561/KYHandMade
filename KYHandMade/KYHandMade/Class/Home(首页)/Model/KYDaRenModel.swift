//
//  KYDaRenModel.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/19.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYDaRenModel: NSObject {

    var user_id :String?
    var nick_name :String?
    var course_count :String?
    var video_count :String?
    var opus_count :String?
    var list :[[String : AnyObject]]?
    var tb_url :String?
    var avatar :String?
    var course_time :String?
    
    
    
    init(dict:[String :AnyObject]) {
        super.init()
        setValuesForKeys(dict)
        
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
