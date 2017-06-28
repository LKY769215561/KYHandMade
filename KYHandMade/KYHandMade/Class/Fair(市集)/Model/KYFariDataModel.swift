//
//  KYFariData.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/28.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYFariDataModel: NSObject {

    // 4个圆
    var hotArray = [KYFariHotDataModel]()
    //  每日特价
    var bestArray = [KYFariBestDataModel]()
    //   热门频道
    var topicBestArray = [String]()
    //   帖子
    var topicArray = [KYFariTopicDataModel]()
    
    
    var last_id : String?
    
    init(dict : [String : AnyObject]) {
        
        for (key,arrayData) in dict {
            
            
            if key == "hot" {
                
                for hotDict in (arrayData as! [[String : AnyObject]]) {
                    hotArray.append(KYFariHotDataModel(dict:hotDict))
                }
                
            }else if key == "best"{
                
                for bestDict in (arrayData as! [[String : AnyObject]]) {
                    bestArray.append(KYFariBestDataModel(dict:bestDict))
                }
                
            }else if key == "topicBest"{
                
                topicBestArray = arrayData as! [String]
                
            }else if key == "topic"{
                
                for topicDict in (arrayData as! [[String : AnyObject]]) {
                    topicArray.append(KYFariTopicDataModel(dict:topicDict))
                }
                last_id = topicArray.last?.last_id
            }
        }
        
        
        super.init()
    }
    
    

    
}
