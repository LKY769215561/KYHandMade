//
//  KYfeatureCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/15.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYFeaturedCell: UITableViewCell {

    @IBOutlet weak var BGImageView: UIImageView!
    
    @IBOutlet weak var SubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var _hotData : KYHotModel?
    var hotData : KYHotModel?{
    
        set{
          _hotData = newValue
            
          let url = URL(string:(_hotData?.pic)!)
           BGImageView.kf.setImage(with: url)
           SubTitle.text = _hotData?.subject
        }
        get{
        
        return _hotData
        }
    }
}
