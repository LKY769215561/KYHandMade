//
//  KYHandTableViewController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/12.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit


class KYHandController: UIViewController {

    
    lazy var pageStyle : KYPageStyle = {
    
      var  style = KYPageStyle()
      style.isScrollEnable = true
      return style
    }()
    
    
    lazy var pageView : KYPageView = {
        
        let pageFrame = CGRect(x:0,y:NAVBAR_HEIGHT,width:SCREEN_WIDTH,height:(SCREEN_HEIGHT - NAVBAR_HEIGHT - TABBAR_HEIGHT))
        let titles = ["综合圈","布艺","皮艺","木艺","编织","饰品","文艺","刺绣","模型","羊毛毡","橡皮章","黏土陶艺","园艺多肉","手绘印刷","手工护肤","美食烘焙","旧物改造","滴胶热缩","电子科技","雕塑雕刻","金属工艺","文玩设计","玉石琥珀","游泳池","沙龙活动","古风首饰","服装裁剪","以物易物","亲子手工","护肤美妆","人形娃娃","拼布","滴胶热缩圈","首饰","串珠","手帐","金工","绕线"]
        let  pgView = KYPageView(frame:pageFrame,titles:titles,style:self.pageStyle)
        pgView.delegate = self
        return pgView
    }()
    
    lazy var contentViews : [UIView] = {
        
        let contentFrame = CGRect(x:0, y:0, width:SCREEN_WIDTH, height:self.pageView.frame.height - self.pageView.style.tabHeight)
        var contents = [UIView]()          //添加子控件
        
        for handName in  self.pageView.titles {
           contents.append(KYHandView(frame:contentFrame,handType:handName))
        }
        
        return contents
    }()
    
    
    
    lazy var addButton : UIButton = {
    
        var button = UIButton(type: .custom)
        button.frame = CGRect(x:SCREEN_WIDTH-50, y:NAVBAR_HEIGHT, width: self.pageStyle.tabHeight, height: self.pageStyle.tabHeight)
        button.setBackgroundImage(UIImage(named:"jia"), for: .normal)
        button.addTarget(self, action: #selector(addButtonClick(btn:)), for: .touchUpInside)
        return button
    }()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(pageView)
        view.addSubview(addButton)
        
    }
    
    
    func addButtonClick(btn : UIButton) {
        
       let animator = XWCircleSpreadAnimator.xw_animator(withStartCenter: btn.center, radius: 20)
       let navVc = UINavigationController(rootViewController:KYHandMoreChildController())
       xw_present(navVc, with: animator)
    }
    

}

extension KYHandController : KYPageViewDelegate{

    func pageViewDidShowContentView(currentIndex: Int, title: String) -> UIView {
       return  contentViews[currentIndex]
    }

}

