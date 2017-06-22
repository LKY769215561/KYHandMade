//
//  KYHandCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/22.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYHandCell: UITableViewCell {

    var _handModel : KYHandModel?
    var handModel : KYHandModel?{
    
        set{
           _handModel = newValue
        }
        get{
        return _handModel
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

}
