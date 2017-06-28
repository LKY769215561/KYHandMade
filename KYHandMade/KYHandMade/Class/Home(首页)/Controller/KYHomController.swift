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

    lazy var pageView : KYPageView = {
    
        let pageFrame = CGRect(x:0,y:NAVBAR_HEIGHT,width:SCREEN_WIDTH,height:(SCREEN_HEIGHT - NAVBAR_HEIGHT - TABBAR_HEIGHT))
        let titles = ["精选","关注","达人","活动"]
        var pageStyle = KYPageStyle()
        let  pgView = KYPageView(frame:pageFrame,titles:titles,style:pageStyle)
        pgView.delegate = self
        return pgView
    }()
    
    lazy var contentViews : [UIView] = {
    
        let contentFrame = CGRect(x:0, y:0, width:SCREEN_WIDTH, height:self.pageView.frame.height - self.pageView.style.tabHeight)
        var contents = [UIView]()          //添加子控件
         contents.append(KYFeaturedView(frame:contentFrame))
         contents.append(KYFocusView(frame:contentFrame))
         contents.append(KYDaRenView(frame:contentFrame))
         contents.append(KYEventView(frame:contentFrame))
        
         return contents
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationItem.title = "首页"
        view.addSubview(pageView)
    }

}

extension KYHomController : KYPageViewDelegate{
    func pageViewDidShowContentView(currentIndex: Int, title: String) -> UIView {
     return contentViews[currentIndex]
    }
}
