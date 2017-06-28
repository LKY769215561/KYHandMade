//
//  KYFairHotCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/28.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYFairHotCell: UICollectionViewCell {

    
    
    @IBOutlet weak var hotImageView: UIImageView!
    
    @IBOutlet weak var hotLabel: UILabel!
    
    
    var _hotModel : KYFariHotDataModel?
    var hotModel : KYFariHotDataModel?{
     
        set{
            _hotModel = newValue
            hotLabel.text = newValue?.name
            let url = URL(string:(newValue?.pic)!)
            hotImageView.kf.setImage(with: url)
        }
        get{
         return _hotModel
        }
     
    }

}
