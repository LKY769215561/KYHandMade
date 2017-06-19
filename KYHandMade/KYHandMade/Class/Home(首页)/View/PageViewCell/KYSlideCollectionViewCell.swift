//
//  KYSlideCollectionViewCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/19.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYSlideCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var shopPic: UIImageView!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var vote: UILabel!
    @IBOutlet weak var useName: UILabel!
    @IBOutlet weak var userPic: UIImageView!
    
    var _slideShopModel : KYSlideShopModel?
    var slideShopModel : KYSlideShopModel?{
      
        set{
          _slideShopModel = newValue
          subtitle.text = _slideShopModel?.subject
           vote.text = _slideShopModel?.votes
            useName.text = _slideShopModel?.uname
            guard let shopUrl = _slideShopModel?.host_pic else {
                return
            }
            shopPic.kf.setImage(with: URL(string:shopUrl)!)
            guard let useUrl = _slideShopModel?.avatar else {
                return
            }
             userPic.kf.setImage(with: URL(string:useUrl)!)
        }
        get{
         return _slideShopModel
        }
    
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        layer.cornerRadius = 5
        
    }

}
