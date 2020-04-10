//
//  KYTutorialTableViewController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/12.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYTutorialTableViewController: UIViewController {

    
  weak  var containView : KYContainerView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavTitleView()
        addChildVC()
    }

    func addNavTitleView() {
    
       weak var weakSelf = self
       navigationItem.titleView  = KYNavTitleView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH * 0.6, height: 44),clickBlock: { (btn) in
        weakSelf?.containView?.updateVCViewFromIndex(index: btn.tag)
        })
    }
    
    func addChildVC() {
        
       let picVC = KYTutorialPicController()
       let videoVC = KYTutoriaVideoController()
       let subVC = KYTutoriSubController()
        
        addChild(picVC)
        addChild(videoVC)
        addChild(subVC)
        
        let  containV = KYContainerView(frame:CGRect(x: 0, y:NAVBAR_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-NAVBAR_HEIGHT),childVCs:self.children,selecdBlock:{ (index) in
        
        })
        
      self.containView = containV
        
       view.addSubview(containV)
    }

}
