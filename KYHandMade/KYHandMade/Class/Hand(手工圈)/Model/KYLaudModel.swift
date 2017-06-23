//
//  KYLaudModel.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/23.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYLaudModel: NSObject {

    var uid : String?
    var uname : String?
    var  avatar : String?
    
    
    
    init(dict:[String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
  
    
}
