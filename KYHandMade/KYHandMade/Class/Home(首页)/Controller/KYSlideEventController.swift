//
//  KYSlideEventController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/14.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYSlideEventController: UIViewController {

     public var slide:KYSlideModel?
     var handId : String?
    
  fileprivate  lazy var pageView : KYPageView = {
        
        let pageFrame = CGRect(x:0,y:NAVBAR_HEIGHT,width:SCREEN_WIDTH,height:(SCREEN_HEIGHT - NAVBAR_HEIGHT))
        let titles = ["活动介绍","最新作品","投票最多"]
        var pageStyle = KYPageStyle()
        let  pgView = KYPageView(frame:pageFrame,titles:titles,style:pageStyle)
        pgView.delegate = self
        return pgView
    }()
    
  fileprivate  lazy var contentViews : [UIView] = {
        
        let contentFrame = CGRect(x:0, y:0, width:SCREEN_WIDTH, height:self.pageView.frame.height - self.pageView.style.tabHeight)
        var contents = [UIView]()          //添加子控件
        let webView = KYWebView(frame:contentFrame)
        webView.handId = self.handId
        contents.append(webView)
        contents.append(KYEventNewView(frame:contentFrame,param:"new",handId :self.handId!))
        contents.append(KYEventNewView(frame:contentFrame,param:"votes",handId :self.handId!))
        return contents
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "活动作品"
        view.addSubview(pageView)
    }



}
extension KYSlideEventController : KYPageViewDelegate{

    func pageViewDidShowContentView(currentIndex: Int, title: String) -> UIView {
          return contentViews[currentIndex]
    }
}


