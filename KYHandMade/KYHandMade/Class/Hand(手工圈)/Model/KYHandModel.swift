//
//  KYHandModel.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/22.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYHandModel: NSObject {

    
    var subject : String? //正文描述
    var add_time : String?  // 发布时间
    var uname : String?     // 发布人
    var avatar : String?     // 发布人头像
    var pic : [String : AnyObject]?  //  发布的图片
    

    var laud_num : Int = 0      // 点赞数
    var laud_list : [String : AnyObject]?  // 点赞信息    头像+名字+ uid
    var comment : [String : AnyObject]?    //评论信息
    var vip_info : [String : AnyObject]?   //vip 信息
    
    init(dict:[String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
        
        if uname != nil {
            uname = "来自" + uname!
        }else{
          uname = "来自手工课堂官方"
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
