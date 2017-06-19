//
//  KYEventCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/19.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYEventCell: UITableViewCell {

    
    @IBOutlet weak var topImageView: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!

    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var _eventModel : KYEventModel?
    var eventModel : KYEventModel?{
      
        set{
          _eventModel = newValue
            
            let url = URL(string:(_eventModel?.m_logo)!)
            topImageView.kf.setImage(with: url)
            guard let time = _eventModel?.c_time else {
                return
            }
            timeLabel.text = "征集作品时间:" + time
            eventLabel.text = _eventModel?.c_name
            if _eventModel?.c_status == "1" {
               statusLabel.text = "进行中"
                statusLabel.textColor = UIColor.black
                
            }else{
                statusLabel.text = "已结束"
                statusLabel.textColor = UIColor.lightGray
            }
        }
        
        get{
        return _eventModel
        }
    
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       selectionStyle = .none
    }


    
}
