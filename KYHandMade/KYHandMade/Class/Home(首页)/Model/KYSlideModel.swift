//
//  KYSlide.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/13.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//  轮播图

import UIKit

class KYSlideModel: NSObject {

     /*
     "hand_daren" = 0;
     "hand_id" = "http://www.shougongke.com/index.php?m=Topic&a=topicDetail&topic_id=1593&topic_type=shiji&funding_id=44";
     "host_pic" = "http://imgs.shougongker.com/Public/data/lunbo/1497334789_y45a8kkesy.jpg@!home_page";
     itemtype = "topic_detail_h5";
     "step_count" = "";
     subject = "\U4f17\U7b79\Uff5c\U62fe\U827a\U5b66\U5802\U5468\U5e74\U5e86\Uff0c\U5168\U7f51\U6700\U4f4e\U4ef7\U9080\U4f60\U505a\U624b\U5de5";
     template = 4;
     type = 2;
     "user_name" = "\U624b\U5de5\U5ba2\U5b98\U65b9";
     */
    
     var hand_daren : String?
     var hand_id : String?
     var host_pic : String?
     var itemtype : String?
     var step_count : String?
     var subject : String?
     var template : String?
     var type : String?
     var user_name : String?
    // var is_expired : String?
    
  
    init(dict:[String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
