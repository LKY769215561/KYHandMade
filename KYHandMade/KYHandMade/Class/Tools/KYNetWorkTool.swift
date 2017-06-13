//
//  KYNetWorkTool.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/13.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

/// 网络请求回调
typealias NetworkFinished = (_ success: Bool,_ result:JSON?,_ error:NSError?) -> ()

class KYNetWorkTool: NSObject {

    /// 网络工具类单例
    
   static let shared = KYNetWorkTool()
    
}


// MARK: - 基础请求方法
extension KYNetWorkTool{

    /**
     GET请求
     
     - parameter urlString:  urlString
     - parameter parameters: 参数
     - parameter finished:   完成回调
     */
    func get(_ urlString : String,parameters : [String : Any],finished:@escaping  NetworkFinished) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(urlString, method: .get, parameters: parameters, headers: nil).responseJSON { (response) in
            self.handle(response: response, finished: finished)
        }
        
    }
    
    /**
     POST请求
     
     - parameter urlString:  urlString
     - parameter parameters: 参数
     - parameter finished:   完成回调
     */
    func post(_ urlString: String, parameters: [String : Any]?, finished: @escaping NetworkFinished) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(urlString, method: .post, parameters: parameters, headers: nil).responseJSON { (response) in
            self.handle(response: response, finished: finished)
        }
    }
    
    
    /// 处理响应结果
    ///   - response: 响应对象
    ///   - finished: 完成回调
    fileprivate func handle(response : DataResponse<Any>,finished:@escaping NetworkFinished)
    {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        switch response.result
        {
        case .success(let value):
       
            let json = JSON(value)
            finished(true, json, nil)
            
        case .failure(let error):
           finished(false,nil,error as NSError?)
        }
    }
    

    

}
