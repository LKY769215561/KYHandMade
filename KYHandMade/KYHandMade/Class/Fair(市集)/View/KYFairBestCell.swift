//
//  KYFairBestCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/28.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYFairBestCell: UICollectionViewCell {

    
    @IBOutlet weak var bestImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
     var _bestModel : KYFariBestDataModel?
    var bestModel : KYFariBestDataModel?{
     
        set{
         _bestModel = newValue
            let url = URL(string:(newValue?.picurl)!)
            bestImageView.kf.setImage(with: url)
            titleLabel.text = newValue?.title
            priceLabel.text = newValue?.price
        }
        get{
        return _bestModel
        }
    }

    
    

}
