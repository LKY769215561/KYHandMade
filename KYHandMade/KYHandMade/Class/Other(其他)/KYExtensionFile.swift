//
//  KYExtensionFile.swift
//  KYHandMade
//
//  Created by Kerain on 2017/7/13.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import Foundation


extension UITableView{
    
    // 1. cell 必须是UITableViewCell的子类   2.cell必须遵守 Reusable 协议
    func registerCell<T : UITableViewCell >(_ cell : T.Type) where T : Reusable {
        register(cell, forCellReuseIdentifier:  T.reusableIdentifier)
    }
    
    func dequeueReusableCell<T : Reusable>(indexPath : IndexPath) -> T{
    
      return  dequeueReusableCell(withIdentifier:T.reusableIdentifier, for: indexPath) as! T
    }
}
