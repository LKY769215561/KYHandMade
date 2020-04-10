//
//  KYAdViewController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/8.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYAdViewController: UIViewController,Nibloadable {


    @IBOutlet weak var adImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        adImageView.image = UIImage(named:"ad")
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(removeAdImageView), userInfo: nil, repeats: false)

    }

    
    @objc func removeAdImageView(){
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.adImageView.transform = CGAffineTransform(scaleX : 1.5, y: 1.6)
            
        }) { (finished) in
            
            UIApplication.shared.keyWindow?.rootViewController = KYTabBarController()
            
        }
        
    }
    

}
