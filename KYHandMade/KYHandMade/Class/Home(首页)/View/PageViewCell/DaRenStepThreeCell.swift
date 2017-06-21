//
//  DaRenStepThreeCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/21.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class DaRenStepThreeCell: UICollectionViewCell {

    @IBOutlet weak var setpBtn: UIButton!
    @IBOutlet weak var intLabel: UILabel!
    @IBOutlet weak var contenImageView: UIImageView!
    
    var currentNum : Int = 0
    
    var _picModel : KYDaRenPicModel?
    var picModel : KYDaRenPicModel?{
        
        set{
            _picModel = newValue
            let stepModel = _picModel?.steps[currentNum]
            guard let step = stepModel else {
                return
            }
            let picUrl = URL(string:step.pic!)
            contenImageView.kf.setImage(with: picUrl)
            intLabel.text = step.content
            setpBtn.setImage(UIImage(named:"ic_course_sort_all"), for: .normal)
            
            guard let sumCount = _picModel?.steps.count else {
                return
            }
            let stepStr = "步骤\(currentNum+1)／\(sumCount)"
            setpBtn.setTitle(stepStr, for: .normal)
        }
        get{
            return _picModel
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        setpBtn.layer.borderWidth = 1
        setpBtn.layer.borderColor = UIColor.white.cgColor
        setpBtn.layer.cornerRadius = 15
        
    }

}
