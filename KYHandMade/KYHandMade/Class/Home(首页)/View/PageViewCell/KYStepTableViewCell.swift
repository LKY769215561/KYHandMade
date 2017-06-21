//
//  KYStepTableViewCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/21.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYStepTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
    }
    var _materModel : KYDaRenMaterialModel?
    var materModel : KYDaRenMaterialModel?{
        set{
           _materModel = newValue
           nameLabel.text  = _materModel?.name
           countLabel.text = _materModel?.num
        }
        get{
         return _materModel
        }
    }
    
    var _toolModel : KYDaRenToolsModel?
    var toolModel : KYDaRenToolsModel?{
        set{
            _toolModel = newValue
            nameLabel.text = _toolModel?.name
            countLabel.text = _toolModel?.num
        }
        get{
            return _toolModel
        }
    }
}
