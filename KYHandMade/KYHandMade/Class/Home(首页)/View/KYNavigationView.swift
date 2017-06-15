//
//  KYNavigationView.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/15.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit
import Kingfisher

class KYNavigationView: UIView {

    @IBOutlet weak var navLabel: UILabel!
    @IBOutlet weak var navImageView: UIImageView!
  
    var _navgationModel : KYNavigationModel?
    var navgationModel : KYNavigationModel?{

        set{
            _navgationModel = newValue
            
            let url = URL(string:(_navgationModel?.pic)!)
            navImageView.kf.setImage(with: url)
            navLabel.text = _navgationModel?.name
        }
    
        get{
             return _navgationModel
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target:self, action: #selector(navgationItemAction(tap:)))
        
        addGestureRecognizer(tap)
    }
    
    
    func navgationItemAction(tap : UITapGestureRecognizer) {
        let webVC = KYWebViewController()
        KYPageRouter.getCurrentNav()?.pushViewController(webVC, animated: true)
    }
    
}
