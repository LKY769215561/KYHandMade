//
//  KYHotData.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/13.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//  热帖

import UIKit

class KYHotModel: NSObject {

    /*
     "mob_h5_url" = "http://www.shougongke.com/index.php?m=Topic&a=topicDetail&topic_id=2204&topic_type=course&is_old=1";
     pic = "http://image.shougongke.com/topic/main/1497349499_45s3d62h7y.jpg@!home_page";
     subject = "\U8fd9\U4e2a\U9713\U8679\U56fd\U7684\U7537\U4eba\U7adf\U7136\U8ba9\U77f3\U5934\U201c\U5f00\U53e3\U8bf4\U8bdd\U201d\U4e86\Uff01";
     "topic_id" = 2204;
     "topic_type" = course;
     
     */
    
    

      var mob_h5_url : String?
      var pic : String?
      var subject : String?
      var topic_id : String?
      var topic_type : String?
      var template : String?

    
    
    init(dict:[String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
 override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
