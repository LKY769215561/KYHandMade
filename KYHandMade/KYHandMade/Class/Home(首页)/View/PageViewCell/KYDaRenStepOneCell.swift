//
//  KYDaRenStepOneCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/21.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYDaRenStepOneCell: UICollectionViewCell {

    
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var subtileLabel: UILabel!
    
    @IBOutlet weak var insLabel: UILabel!
    @IBOutlet weak var cateImaheView: UIImageView!
    
    @IBOutlet weak var cateNameLaebl: UILabel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var fanLabel: UILabel!
    
    @IBOutlet weak var fanfanLabel: UILabel!
    
    
    var _picModel : KYDaRenPicModel?
    var picModel : KYDaRenPicModel?{
    
        set{
        _picModel = newValue
          
            let bgUrl = URL(string:(_picModel?.host_pic_s)!)
            bgImageView.kf.setImage(with: bgUrl)
            
            
            let iconUrl = URL(string:(_picModel?.face_pic)!)
            iconImageView.kf.setImage(with: iconUrl)
            iconImageView.layer.cornerRadius = 30
            iconImageView.layer.masksToBounds = true
            
            
            let cateUrl = URL(string:(_picModel?.cate_pic)!)
            cateImaheView.kf.setImage(with:cateUrl)
            cateImaheView.layer.cornerRadius = 10
            cateImaheView.clipsToBounds = true
            
            cateNameLaebl.text = _picModel?.cate_name
            subtileLabel.text = _picModel?.subject
            insLabel.text = _picModel?.summary
            fanLabel.text = _picModel?.user_name
            
            var view = _picModel?.view
            if view == nil {
                view = ""
            }
            view?.append("人气")
            
            var collect = _picModel?.collect
            if collect == nil {
                collect = ""
            }
            collect?.append("收藏")
            
            var comment_num = _picModel?.comment_num
            if comment_num == nil {
                comment_num = ""
            }
            comment_num?.append("评论")
            
            var laud = _picModel?.laud
            if laud == nil {
                laud = ""
            }
            laud?.append("赞")
            
            
            fanfanLabel.text = view! + "|" + collect! + "|" + comment_num! + "|" + laud!
        }
        get{
        return _picModel
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        let blurEffect = UIBlurEffect(style: .dark)
        let effectView = UIVisualEffectView(effect:blurEffect)
        effectView.alpha = 0.5
        effectView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        bgImageView.addSubview(effectView)
    }

}
