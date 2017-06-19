//
//  KYEventModel.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/19.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYEventModel: NSObject {

    var c_status : String?
    var c_id : String?
    var c_name : String?
    var m_logo : String?
    var c_time : String?
    var Id : String?
    
    init(dict:[String :AnyObject]) {
        super.init()
        setValuesForKeys(dict)
        
        guard  let  eventId = dict["id"] else{
           return
        }
        Id = eventId as! String
        
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
