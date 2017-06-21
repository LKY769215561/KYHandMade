//
//  KYPageCollectionViewCell.swift
//  KYPageView
//
//  Created by Kerain on 2017/6/13.
//  Copyright © 2017年 Kerain. All rights reserved.
//

import UIKit

class KYPageCollectionViewCell: UICollectionViewCell {
    
    var lastContainView : UIView?
    
    
    
    func refreshWithContainView(containView : UIView) {
        lastContainView?.removeFromSuperview()
        addSubview(containView)
        lastContainView = containView
    }
    
}
