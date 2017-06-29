
//
//  KYMyCell.swift
//  KYHandMade
//
//  Created by 梁奎元 on 2017/6/28.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYMyCell: UITableViewCell {

    
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var subLabel: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    
}
