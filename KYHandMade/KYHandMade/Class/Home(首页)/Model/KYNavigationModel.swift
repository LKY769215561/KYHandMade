//
//  KYNavigationData.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/13.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYNavigationModel: NSObject {

    /*
     "link_info" = 1311;
     "link_type" = shijiTopicInfo;
     "mob_h5_url" = "http://www.shougongke.com/index.php?m=Topic&a=topicDetail&topic_id=1311&topic_type=shiji";
     name = "\U7528\U6237\U8001\U7237";
     pic = "http://image.shougongke.com/app/index/navigation/appIndexNav32.png@!home_page";
     template = 4;
     type = 3;
     */
    
     var link_info : String?
     var link_type : String?
     var mob_h5_url : String?
     var name : String?
     var pic : String?
     var template : String?
     var type : String?
    
    init(dict:[String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
   class func addNavModel() -> KYNavigationModel {
    
      let dictData = ["pic":"http://image.shougongke.com/app/index/navigation/appIndexNav12.png","name":"签到"]
       return KYNavigationModel(dict:dictData as [String : AnyObject])
    }
    
    
  override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
