//
//  KYFariTopicDataModel.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/28.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYFariTopicDataModel: NSObject {

    
    var  topic_id : String?
    var  host_pic : String?
    var  topic_name : String?
    var  template : String?
    var  mob_h5_url : String?
    var  last_id : String?
    
    init(dict:[String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
