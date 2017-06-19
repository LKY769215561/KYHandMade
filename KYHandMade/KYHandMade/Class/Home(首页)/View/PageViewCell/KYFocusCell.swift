//
//  KYFocusCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/16.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYFocusCell: UICollectionViewCell {

    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentImageVIew: UIImageView!
    @IBOutlet weak var subLael: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.layer.cornerRadius = 25
        iconImageView.layer.masksToBounds = true
        layer.cornerRadius = 20
    }
    
    
    var _focusModel : KYFocusModel?
    var focusModel : KYFocusModel?{
    
        set{
            _focusModel = newValue
            iconImageView.image = UIImage(named:(_focusModel?.iconStr)!)
            contentImageVIew.image = UIImage(named:(_focusModel?.contentImage)!)
            nameLabel.text = _focusModel?.nameStr
            subLael.text = _focusModel?.contenStr
        }
        get{
        
         return _focusModel
        }
    }
    

}
