//
//  KYFariTopicCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/28.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYFariTopicCell: UICollectionViewCell {

    
    
    @IBOutlet weak var bgImageVIew: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var _topicModel : KYFariTopicDataModel?
    var topicModel : KYFariTopicDataModel?{
     
        set{
        _topicModel = newValue
            let url = URL(string : (newValue?.host_pic)!)
            bgImageVIew.kf.setImage(with: url)
            titleLabel.text = newValue?.topic_name
        }
        get{
          return _topicModel
        }
    }


}
