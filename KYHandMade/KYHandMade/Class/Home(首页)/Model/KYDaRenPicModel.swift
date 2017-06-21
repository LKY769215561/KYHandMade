//
//  KYDaRenPicModel.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/21.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYDaRenPicModel: NSObject {

      var subject : String? // 主标题
      var summary : String? // 概述
      var cate_name : String? // 分类名字
      var cate_pic  : String? // 分类图片
      var user_name : String? // 昵称
      var face_pic : String? // 头像
      var view : String? // 人气
      var collect : String? // 收藏
      var laud : String? //赞
      var comment_num : String? // 评论
      var tools  =  [KYDaRenToolsModel]()  // 工具
      var materials  =  [KYDaRenMaterialModel]() // 材料
      var steps  =  [KYDaRenStepModel]() // 步骤
      var tips : String?  // 小贴士
      var host_pic_s : String? // 背景
      var host_pic_ss : String?
    
    // 实例化
    init(dict:[String :AnyObject]) {
        super.init()
    
        for  (key ,value) in dict {
            
            
            if key == "tools" {
                
                let dicts = value as! [[String : AnyObject]]
                for dict in dicts {
                    let toolModel = KYDaRenToolsModel(dict:dict)
                    tools.append(toolModel)
                }
                
            }else if key == "material"{
            
                let dicts = value as! [[String : AnyObject]]
                for dict in dicts {
                    let materialModel = KYDaRenMaterialModel(dict:dict)
                    materials.append(materialModel)
                }
            }else if key == "step"{
                
                let dicts = value as! [[String : AnyObject]]
                for dict in dicts {
                    let stepModel = KYDaRenStepModel(dict:dict)
                    steps.append(stepModel)
                }
            }else{

              setValue(value, forKey: key)
            }
            
            
        }
    }
    
       override func setValue(_ value: Any?, forUndefinedKey key: String) {}

}
