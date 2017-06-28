//
//  KYFariBestDataModel.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/28.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYFariBestDataModel: NSObject {
    var  num_iid : String?
    var  title : String?
    var  picurl : String?
    var  price : String?
    var  yh_price : String?
    var  shop_type : String?
    var  sum : String?
    var  open_iid : String?
    var  cover_pic : String?

    init(dict:[String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
        price = "¥" + price!
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
