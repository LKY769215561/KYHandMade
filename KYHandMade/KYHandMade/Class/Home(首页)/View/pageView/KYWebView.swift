//
//  KYWebView.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/19.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYWebView: UIView {


    // 秒杀
    var _navgationModel : KYNavigationModel?
    var navgationModel : KYNavigationModel?{
     
        set{
            _navgationModel = newValue
            loadURL(urlStr: _navgationModel?.mob_h5_url, title:"专题详情")
        }
        get{
         return _navgationModel
        }
      
    }
    
    // 活动
     var  _handId : String?
     var  handId : String?{
    
        set{
           _handId = newValue
           
            guard let handId = _handId else {
                return
            }
          let  webURl = HomeBaseURL + "?c=Competition&cid=" + handId
          loadURL(urlStr: webURl, title: nil)
        }
    
        get{
         return _handId
        }
    }
    
    var _advanceModel : KYAdvanceModel?
    var advanceModel : KYAdvanceModel?{
        
        set{
            _advanceModel = newValue
            loadURL(urlStr: _advanceModel?.mob_h5_url, title: "手工课官方")
        }
        
        get{
            
            return _advanceModel
        }
    }
    
    
    
      // 轮播图
    var _slide:KYSlideModel?
    var slide:KYSlideModel?{
        
        set{
            _slide = newValue
            
            guard let itemType = slide?.itemtype else {
                return
            }
            guard  let hand_id = slide?.hand_id else {
                return
            }
            if slide?.itemtype == "class_special" {
                let url = "http://www.shougongke.com/index.php?m=HandClass&a=\(itemType)&spec_id=\(hand_id)"
                loadURL(urlStr: url, title: "课堂专题")
                
            }else if slide?.itemtype == "topic_detail_h5" {
                
                loadURL(urlStr: hand_id, title: "课堂专题")
                
            }else if slide?.itemtype == "event" {
                 let url = HomeBaseURL + "?c=Competition&cid=" + itemType + hand_id
                 loadURL(urlStr: url, title: "课堂专题")
            }
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
            loadURL(urlStr: _hotData?.mob_h5_url, title: "专题详情")
        }
        get{
            
            return _hotData
        }
    }
    
    
    var _topicModel : KYFariTopicDataModel?
    var topicModel : KYFariTopicDataModel?{
        
        set{
            _topicModel = newValue
            loadURL(urlStr: topicModel?.mob_h5_url, title:nil)
        }
        get{
            return _topicModel
        }
    }
    
    
    public   lazy  var webView : UIWebView = {
    
        let webV = UIWebView(frame: self.bounds)
        webV.delegate = self
        webV.scalesPageToFit = true
        webV.backgroundColor = UIColor.lightGray
        webV.scrollView.delegate = self
        return webV
        
    }()
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        addSubview(webView)
    }
    
    func loadURL(urlStr : String?,title:String?) {
        
        guard let webUrlString = urlStr else {
            return
        }
        
        let url = URL(string:webUrlString)
        guard let url2 = url else {
            return
        }
        KYPageRouter.getCurrentVC().navigationItem.title = title
        webView.loadRequest(URLRequest(url:url2))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension KYWebView : UIScrollViewDelegate{


}

extension KYWebView : UIWebViewDelegate{

    func webViewDidStartLoad(_ webView: UIWebView) {
        KYProgressHUD.showInfoWithStatus("小客正在努力加载中...")
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        KYProgressHUD.showInfoWithStatus("加载失败了")
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        KYProgressHUD.dismiss()
    }
    
}


