//
//  KYDarenCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/19.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYDarenCell: UITableViewCell {


    @IBOutlet weak var guanzhuBtn: UIButton!
    @IBOutlet weak var threeImageView: UIImageView!
    @IBOutlet weak var twoImageView: UIImageView!
    @IBOutlet weak var oneImageView: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var imageViews = [UIImageView]()
    
    
    var _darenModel : KYDaRenModel?
    var darenModel : KYDaRenModel?{
     
        set{
           _darenModel = newValue
            
            let url = URL(string:(_darenModel?.avatar)!)
            iconImageView.kf.setImage(with: url)
            nameLabel.text  = _darenModel?.nick_name
            
            guard   let courseCount = _darenModel?.course_count else{
              return
            }
            guard   let video_count = _darenModel?.video_count else{
                return
            }
            guard   let opus_count = _darenModel?.opus_count else{
                return
            }

            subTitleLabel.text = courseCount + "图文教程|" + video_count + "视频教程|" + opus_count + "手工圈"
            
            guard let list = _darenModel?.list else {
                return
            }
            
            for (index, dict) in list.enumerated() {
                let tap = UITapGestureRecognizer(target: self, action: #selector(imageViewClick(tap:)))
               
                let imageView = imageViews[index]
                imageView.addGestureRecognizer(tap)
                imageView.tag = index
        
                let imageStr = dict["host_pic"] as! String
                let imageURL = URL(string:imageStr)
                imageView.kf.setImage(with: imageURL)
  
            }
        }
        get{
          return _darenModel
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        guanzhuBtn.layer.cornerRadius = 5
        guanzhuBtn.layer.borderWidth = 1
        
        iconImageView.layer.cornerRadius = 25
        iconImageView.layer.masksToBounds = true
        
        imageViews.append(oneImageView)
        imageViews.append(twoImageView)
        imageViews.append(threeImageView)
        
    }


    
    @IBAction func gaunzhuBtnClick(_ sender: Any) {
        
        KYProgressHUD.showWithStatus("开发中...")
    }
    
    func imageViewClick(tap : UITapGestureRecognizer) {
        
        guard let list = _darenModel?.list else {
            return
        }
        let dict = list[(tap.view?.tag)!]
        let animator = XWCoolAnimator.xw_animator(with: .scanningFromLeft)
        let picVC = KYDaRenPicController(collectionViewLayout: UICollectionViewLayout())
        picVC.tagCpunt = dict["hand_id"] as? String
        KYPageRouter.getCurrentVC()?.xw_present(picVC, with: animator)
        
    }
    

}
