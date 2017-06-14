//
//  KYWebViewController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/14.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYWebViewController: UIViewController {

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
                loadSlideDataType(urlString:url, title: "课堂专题")
            }else if slide?.itemtype == "topic_detail_h5" {
                
                loadSlideDataType(urlString: hand_id, title: "专题详情")
                
            }else if slide?.itemtype == "event" {
                
                let BaseURL = "http://m.shougongke.com/index.php?c=Competition&cid="
                loadSlideDataType(urlString:BaseURL+itemType+hand_id, title: "课堂专题")
            } 
        }
    
        get{
        
        return _slide
        }
        
    }
    
    
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        webView.scalesPageToFit = true
        webView.backgroundColor = UIColor.white
        webView.scrollView.delegate = self
        
        
    }
    
    
    
    
    
    
    func loadSlideDataType(urlString : String,title:String) {
        
        
        let url = URL(string:urlString)
        guard let url2 = url else {
            return
        }
 
        view.addSubview(webView)
        webView.loadRequest(URLRequest(url:url2))
        navigationItem.title = title
        
    }
    



}

extension KYWebViewController : UIWebViewDelegate{

}
extension KYWebViewController : UIScrollViewDelegate{


}


