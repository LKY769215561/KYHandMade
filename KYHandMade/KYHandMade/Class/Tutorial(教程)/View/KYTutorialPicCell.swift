//
//  KYTutorialPicCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/20.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit


class KYTutorialPicCell: UICollectionViewCell {

    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var hotLabel: UILabel!
    
    
    var _picModel : KYTutoriaPicModel?
    var picModel : KYTutoriaPicModel?{
    
        set{
            _picModel = newValue
            let url = URL(string:(_picModel?.host_pic)!)
            bgImageView.kf.setImage(with: url)
            subtitle.text = _picModel?.subject
            userName.text = "by" + (_picModel?.user_name)!
            hotLabel.text = (_picModel?.view)! + "人气" + (_picModel?.collect)! + "收藏"
            bgView.backgroundColor = UIColor(hexString:(_picModel?.bg_color)!)
        }
        get{
            return _picModel
        }
    
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }

}
