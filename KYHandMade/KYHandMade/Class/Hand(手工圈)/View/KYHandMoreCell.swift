//
//  KYHandMoreCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/7/8.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYHandMoreCell: UICollectionViewCell {

    @IBOutlet weak var handLabel: UILabel!

    var _titleStr : String?
    var titleStr : String?{
      
        set{
          _titleStr = newValue
          handLabel.text = newValue
        }
        get{
        return _titleStr
        }
    
    }
    
    

}
