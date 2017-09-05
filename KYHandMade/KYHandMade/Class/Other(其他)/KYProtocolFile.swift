//
//  KYProtocolFile.swift
//  KYHandMade
//
//  Created by Kerain on 2017/7/13.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


// 从xib 中加载 view
protocol Nibloadable {}

// 限定UIView的子类才能共享这个方法
extension Nibloadable where Self : UIView{
    
    // 协议或者结构体中如果要使用类方式   不用class   用static
     static func loadFromNib(nibname : String? = nil) -> Self{
     let nib = nibname ?? "\(self)"
     return  Bundle.main.loadNibNamed(nib, owner: nil, options: nil)?.first as! Self
    }
}

// 限定UIViewController的子类才能共享这个方法
extension Nibloadable where Self : UIViewController{

    static func loadFromNib() -> Self {
        return Self(nibName:"\(self)" , bundle :nil)
    }
}

protocol Reusable {
    
    static var reusableIdentifier : String {get}
}

//  UITableViewCell需遵守的协议
extension Reusable{

    static var reusableIdentifier : String {
        return "\(self)" + "Id"
     }
}


protocol Requestable {
    
    var URLString : String {get}
    var type : HTTPMethod {get}
    var parametes :  [String : Any]{get}
    
    associatedtype ResultData
    var data : ResultData {set get}
    
    func parseResult(_ result : Any)
}

extension Requestable{

//    func requestData(_ finished : @escaping NetworkFinished) -> Void {
//        
//        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
//        Alamofire.request(URLString, method: method, parameters: parametes).responseJSON { (response : DataResponse<Any>) in
//            guard let result = response.result.value else {
//                KYProgressHUD.showErrorWithStatus("失败了,赶紧跑")
//                return
//            }
//            finished(true, JSON(result), nil)
//        }
//    }
    
    func requestData(_ finished : @escaping ()->()) -> Void {
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(URLString, method: method, parameters: parametes).responseJSON { (response : DataResponse<Any>) in
            guard let result = response.result.value else {
                KYProgressHUD.showErrorWithStatus("失败了,赶紧跑")
                return
            }
            self.parseResult(result)
            
            finished()
        }
    }
}




