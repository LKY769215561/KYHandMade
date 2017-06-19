//
//  KYWebView.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/19.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYWebView: UIView {


     var  _handId : String?
     var  handId : String?{
    
        set{
           _handId = newValue
           
            guard let handId = _handId else {
                return
            }
          let  webURl = HomeBaseURL + "?c=Competition&cid=" + handId
          loadURL(urlStr: webURl)
        }
    
        get{
         return _handId
        }
    }
    
    
    private   lazy  var webView : UIWebView = {
    
    return UIWebView(frame: self.bounds)
        
    }()
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        addSubview(webView)
    }
    
    func loadURL(urlStr : String?) {
        
        guard let webUrlString = urlStr else {
            return
        }
        
        let url = URL(string:webUrlString)
        guard let url2 = url else {
            return
        }
        webView.loadRequest(URLRequest(url:url2))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
