//
//  KYHomController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/12.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit
import Kingfisher

class KYHomController: UIViewController {

    var pageView : KYPageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let pageFrame = CGRect(x:0,y:64,width:view.bounds.width,height:view.bounds.height-64-44)
        let titles = ["精选","关注","达人","活动"]
        var pageStyle = KYPageStyle()
        pageStyle.isScrollEnable = false
        
        pageView = KYPageView(frame:pageFrame,titles:titles,style:pageStyle)
        pageView.delegate = self
        view.addSubview(pageView)
        
     
        
    }

}

extension KYHomController : KYPageViewDelegate{

    func pageViewDidShowContentView(currentIndex: Int, title: String) -> UIView {
        
        
        let contentFrame = CGRect(x:0, y:0, width:view.bounds.width, height:pageView.frame.height-pageView.style.tabHeight)
        
        switch currentIndex {
        case 0:
            return KYFeaturedView(frame:contentFrame)
        case 1:
            return KYFocusView(frame:contentFrame)
        case 2:
            return KYDaRenView(frame:contentFrame)
        case 3:
            return KYEventView(frame:contentFrame)
        default :
            return UIView()
        }
    }

}
