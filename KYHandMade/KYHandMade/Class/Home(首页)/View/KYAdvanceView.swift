//
//  KYAdvanceView.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/15.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYAdvanceView: UIView {

    @IBOutlet weak var adImageView: UIImageView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
    var _advanceModel : KYAdvanceModel?
    var advanceModel : KYAdvanceModel?{
    
        set{
            _advanceModel = newValue
            let url = URL(string:(_advanceModel?.pic)!)
            adImageView.kf.setImage(with: url)
        }
    
        get{
        
          return _advanceModel
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target:self, action: #selector(advanceItemAction(tap:)))
        
        addGestureRecognizer(tap)
    }
    
    
    func advanceItemAction(tap : UITapGestureRecognizer) {
        let webVC = KYWebViewController()
        KYPageRouter.getCurrentNav()?.pushViewController(webVC, animated: true)
    }
    
}
