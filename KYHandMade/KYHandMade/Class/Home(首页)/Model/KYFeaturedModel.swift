
//
//  KYHomeData.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/13.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYFeaturedModel: NSObject {

 
    // 轮播图
    var dataSlides : [KYSlideModel] = []
    // 热帖
    var dataHotArray : [KYHotModel] = []
    // 热帖
    var dataNavigationArray : [KYNavigationModel] = []
    // 热帖
    var dataAdvanceArray : [KYAdvanceModel] = []
    
    init(dict : [String : AnyObject]) {
        
        for (key,arrayData) in dict {
            
            
            if key == "slide" {
                
                for slideDict in (arrayData as! NSArray) {
                    dataSlides.append(KYSlideModel(dict:slideDict as! [String : AnyObject]))
                }
                
            }else if key == "hotTopic"{
                
                for hotTopicDict in (arrayData as! NSArray) {
                    dataHotArray.append(KYHotModel(dict:hotTopicDict as! [String : AnyObject]))
                }
            
            }else if key == "navigation"{
                
                for navigationDict in (arrayData as! NSArray) {
                    dataNavigationArray.append(KYNavigationModel(dict:navigationDict as! [String : AnyObject]))
                }
                
                // 添加签到模型
                 dataNavigationArray.append(KYNavigationModel.addNavModel())
                
            }else if key == "advance"{
                
                for advanceDict in (arrayData as! NSArray) {
                    dataAdvanceArray.append(KYAdvanceModel(dict:advanceDict as! [String : AnyObject]))
                }
                
            }
        }
        
        
        super.init()
    }
    
    
    
}
