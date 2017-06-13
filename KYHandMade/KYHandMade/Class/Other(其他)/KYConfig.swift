//
//  KYConfig.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/13.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit
import MJRefresh

/**
 RGB颜色构造
 */
func RGB(_ r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
}

/**
 快速创建上拉加载更多控件
 */
func setupFooterRefresh(_ target: AnyObject, action: Selector) -> MJRefreshFooter {
    let footerRefresh = MJRefreshBackNormalFooter(refreshingTarget: target, refreshingAction: action)
    footerRefresh?.isAutomaticallyHidden = true
    footerRefresh?.setTitle("正在加载", for: MJRefreshState.refreshing)
    footerRefresh?.setTitle("可以松开了", for: MJRefreshState.pulling)
    footerRefresh?.setTitle("上拉加载更多", for: MJRefreshState.idle)
    footerRefresh?.setTitle("没有啦~~~", for: MJRefreshState.noMoreData)
    return footerRefresh!
}

/**
 快速创建下拉加载最新控件
 */
func setupHeaderRefresh(_ target: AnyObject, action: Selector) -> MJRefreshNormalHeader {
    let headerRefresh = MJRefreshNormalHeader(refreshingTarget: target, refreshingAction: action)
    headerRefresh?.lastUpdatedTimeLabel.isHidden = true
    headerRefresh?.isAutomaticallyChangeAlpha = true
    headerRefresh?.setTitle("下拉刷新", for: .idle)
    headerRefresh?.setTitle("松开刷新", for: .pulling)
    headerRefresh?.setTitle("小客正在为你刷新", for: .refreshing)
    
    headerRefresh?.stateLabel.font = UIFont.systemFont(ofSize: 15)
    headerRefresh?.stateLabel.textColor = UIColor.darkGray
    
    return headerRefresh!
}
