//
//  KYContainerView.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/20.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYContainerView: UIScrollView {

    
    var selecdBlock : ((_ index : Int)->())?
    var childVCs : [UIViewController]?
    
  
    init(frame:CGRect,childVCs:[UIViewController],selecdBlock:@escaping (_ index : Int)->()) {
        super.init(frame: frame)
        
        self.selecdBlock = selecdBlock
        self.childVCs = childVCs
        backgroundColor = UIColor.white
        isPagingEnabled = true
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        self.delegate = self
        let count : CGFloat = CGFloat((self.childVCs?.count)!)
        contentSize = CGSize(width:count * SCREEN_WIDTH, height: 0)
        
        for (index,subVC) in childVCs.enumerated() {
            
            let subViewX = CGFloat(index) * SCREEN_WIDTH
            subVC.view.frame = CGRect(x:subViewX, y:0, width: SCREEN_WIDTH, height: height)
            addSubview(subVC.view)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateVCViewFromIndex(index : Int) {
        setContentOffset(CGPoint(x:CGFloat(index) * SCREEN_WIDTH, y: 0), animated: true)
    }
    
}

extension KYContainerView : UIScrollViewDelegate{

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let page = (scrollView.contentOffset.x + SCREEN_WIDTH / 2.0 ) / SCREEN_WIDTH
        guard let block = self.selecdBlock else {
            return
        }
        block(Int(page))
    }

}
