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
    
    
    var webView: KYWebView = {
        let web = KYWebView(frame:CGRect(x: 0, y: NAVBAR_HEIGHT, width:SCREEN_WIDTH, height: SCREEN_HEIGHT-NAVBAR_HEIGHT))
        return web
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

      view.addSubview(webView)

    }
    
    
    
    
    
    

}



