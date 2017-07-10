//
//  KYHandMoreHeadView.swift
//  KYHandMade
//
//  Created by Kerain on 2017/7/8.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYHandMoreHeadView: UICollectionReusableView {

    @IBOutlet weak var plocerLabel: UILabel!

    var _headStr : String?
    var headStr : String?{
        
        set{
            _headStr = newValue
            plocerLabel.text = newValue
        }
        get{
            return _headStr
        }
        
    }
}
