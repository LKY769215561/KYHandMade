//
//  UIViewExtension.swift
//  BaiSiBuDeJie-swift
//
//  Created by zhoujianfeng on 16/7/28.
//  Copyright © 2016年 zhoujianfeng. All rights reserved.
//

import UIKit

extension UIView {
    
    /// 获取或设置 x
    public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    /// 获取或设置 y
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }

    
    /// 获取或设置 width
    public var width_ky: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    /// 获取或设置 height
    public var height_ky: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    /// 获取或设置 size
    public var size_ky: CGSize {
        get {
            return frame.size
        }
        set {
            frame.size = newValue
        }
    }
    
    /// 获取或设置 origin
    public var origin_ky: CGPoint {
        get {
            return frame.origin
        }
        set {
            frame.origin = newValue
        }
    }
    
    public var bottom_ky: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
    }
    
    public var right_ky : CGFloat{
    
        get{
        return self.frame.maxX
        }
    }
 
}
