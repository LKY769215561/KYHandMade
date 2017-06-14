//
//  KYAdvanceData.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/13.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYAdvanceModel: NSObject {
   

    /*
     "link_info" = 1565;
     "link_type" = courseTopicInfo;
     "mob_h5_url" = "http://www.shougongke.com/index.php?m=Topic&a=topicDetail&topic_id=1565&topic_type=course";
     pic = "http://image.shougongke.com/app/index/advance/appIndexad_1482897899.jpg@!home_page";
     */
    
    var link_info : String?
    var link_type : String?
    var mob_h5_url : String?
    var pic : String?
    
    
    init(dict:[String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
