//
//  KYFariTopicBestCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/28.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYFariTopicBestCell: UICollectionViewCell {

    @IBOutlet weak var bgImageView: UIImageView!
    
    
    var _picStr : String?
    var picStr : String?{
     
        set{
        _picStr = newValue
         let url = URL(string : newValue!)
          bgImageView.kf.setImage(with: url)
        }
        get{
        
          return _picStr
        }
    }

    
    
    

}
