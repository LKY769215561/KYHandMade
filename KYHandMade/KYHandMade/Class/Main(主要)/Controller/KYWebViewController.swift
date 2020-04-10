//
//  KYWebViewController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/14.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYWebViewController: UIViewController {
    
    
    // 秒杀
    var _navgationModel : KYNavigationModel?
    var navgationModel : KYNavigationModel?{
        
        set{
            _navgationModel = newValue
           webView.navgationModel = _navgationModel
        }
        get{
            return _navgationModel
        }
        
    }
    
    // 轮播图
    var _slide: KYSlideModel?
    var slide: KYSlideModel?{
     
        set{
        
        _slide = newValue
          webView.slide = _slide
        }
        get{
        
        return _slide
        }
     
    }
    // 精选热帖
    var _hotData : KYHotModel?
    var hotData : KYHotModel?{
        
        set{
            _hotData = newValue
            webView.hotData = _hotData
        }
        get{
            
            return _hotData
        }
    }
    
    
    var _advanceModel : KYAdvanceModel?
    var advanceModel : KYAdvanceModel?{
        
        set{
            _advanceModel = newValue
            webView.advanceModel = _advanceModel
        }
        
        get{
            
            return _advanceModel
        }
    }
    
    var _topicModel : KYFariTopicDataModel?
    var topicModel : KYFariTopicDataModel?{
        
        set{
            _topicModel = newValue
            webView.topicModel = _topicModel
        }
        get{
            return _topicModel
        }
    }
    
    
    var isPush : Bool = true
    

 public  lazy var webView: KYWebView = {
    
    var web : KYWebView
        if self.isPush
        {
            web = KYWebView(frame:CGRect(x: 0, y:NAVBAR_HEIGHT, width:SCREEN_WIDTH, height: SCREEN_HEIGHT-NAVBAR_HEIGHT))
        }else
        {
            web = KYWebView(frame:CGRect(x: 0, y:0, width:SCREEN_WIDTH, height: SCREEN_HEIGHT))
            
            let backBtn = UIButton(type:.custom)
            backBtn.frame = CGRect(x: 5, y: 25, width: 20, height: 20)
            backBtn.setImage(UIImage(named:"Image"), for: .normal)
            backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            web.addSubview(backBtn)
        }
        return web
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    // 优先响应
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
          view.addSubview(webView)
    }
    
    @objc func backAction() {
        dismiss(animated: true, completion: nil)
    }
    
    

}



