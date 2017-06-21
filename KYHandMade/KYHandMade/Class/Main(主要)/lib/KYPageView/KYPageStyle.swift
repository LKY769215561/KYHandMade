
//
//  HYPageStyle.swift
//  KYPageView
//
//  Created by Kerain on 2017/3/14.
//  Copyright © 2017年 Kerain. All rights reserved.
//

import UIKit

struct KYPageStyle {

    // MARK:文字底部滚动条
    //  选项卡条背景色
    var titleViewBG : UIColor = UIColor.white


    
    //  选项卡条高度
    var tabHeight:CGFloat = 40
    
    //  选项卡标题间距
    let titleMargin:CGFloat = 10
    
    //  选项卡字体普通颜色
    var normalColor : UIColor = UIColor.lightGray
    
    //  选项卡字体选中颜色
    var selectColor : UIColor = UIColor.red
    
    //  选项卡字体
    var titleFont : UIFont = UIFont.boldSystemFont(ofSize: 15)
    
    //  选项卡是否可以滚动
    var isScrollEnable : Bool = false
    
    //  颜色渐变
    var titleColorChange : Bool = true
    
    // 是否显示文字底部滑动
    var isShowBottomLine : Bool = true
    
    // MARK:文字底部滚动条
    
    //  默认等于文字宽度     否则会平分屏幕宽度
    var isEqueToTitleLength  : Bool = true
    
    //  背景色
    var bottomLineBackGroundColor : UIColor = UIColor.red
    //  高度
    var bottomLineHeight : CGFloat = 1
    
    // MARK:选项卡内容区
    //  背景色
    var contentViewBG : UIColor = UIColor.lightGray
}
