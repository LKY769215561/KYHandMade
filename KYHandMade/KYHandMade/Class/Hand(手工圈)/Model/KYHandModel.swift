//
//  KYHandModel.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/22.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYHandModel: NSObject {

    
    var subject : String? //正文描述
    var add_time : String?  // 发布时间
    var uname : String?     // 发布人
    var avatar : String?     // 发布人头像
   // var pic : [[String : AnyObject]]?  //  发布的图片
    var picModels = [KYPicModel]()
    
    
    
    var laud_num : Int = 0      // 点赞数
    //var laud_list : [String : AnyObject]?  // 点赞信息    头像+名字+ uid
    var laudListModels = [KYLaudModel]()
    
   // var comment : [String : AnyObject]?    //评论信息
    var commentModels = [KYCommentModel]()
    
   // var vip_info : [KYViModel]?   //vip 信息
    var vip_infoModel : KYVipModel?
    init(dict:[String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
        
        if  uname != nil {
            uname = "来自" + uname!
        }else{
            uname = "来自手工课堂官方"
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    
        if key == "pic" {
            
            let pics = value as! [[String : AnyObject]]
            for picDict in pics{
                let picModel = KYPicModel(dict: picDict)
                picModels.append(picModel)
            }
        }else if key == "laud_list" {
        
            let lauds = value as! [[String : AnyObject]]
            for laudDict in lauds{
                let laudModel = KYLaudModel(dict: laudDict)
                laudListModels.append(laudModel)
            }
        }else if key == "comment" {
            
            let commentDict = value as! [[String : AnyObject]]
            for comment in commentDict{
                let commentModel = KYCommentModel(dict: comment)
                commentModels.append(commentModel)
            }
        }else if key == "vip_info" {
            
            let vipinfoDict = value as! [String : AnyObject]
            vip_infoModel = KYVipModel(dict:vipinfoDict)
        }
        
    }
}
