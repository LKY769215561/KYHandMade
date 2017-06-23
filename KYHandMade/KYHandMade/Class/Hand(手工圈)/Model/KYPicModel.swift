//
//  KYPicModel.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/23.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYPicModel: NSObject {

    var url : String?
    var width : CGFloat = 0
    var height : CGFloat = 0
    
    
    
    
    init(dict:[String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
    
    
}
