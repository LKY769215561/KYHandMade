//
//  KYLayout.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/16.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYLayout: UICollectionViewFlowLayout {

    
    //判定为布局需要被无效化并重新计算的时候,布局对象会被询问以提供新的布局。
    override public func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    //为所有item返回一个layout attributes数组，数组中元素的类型为UICollectionViewLayoutAttributes。UICollectionViewLayoutAttributes记录了一个layout的位置、大小、透明度等信息
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
  
        let attributes = super.layoutAttributesForElements(in: rect)
        
//        guard  let collecView = collectionView else{
//         return attributes
//        }
        
        let collecView = collectionView!
        
        guard let atttis = attributes else {
            return attributes
        }
        
        let offsetY = collecView.contentOffset.y
        let collectionViewFrameHeight = collecView.frame.height
        let collectionViewContentHeight = collecView.contentSize.height
        let ScrollViewContentInsetBottom = collecView.contentInset.bottom
        
        let bottomOffset = offsetY + collectionViewFrameHeight - collectionViewContentHeight - ScrollViewContentInsetBottom
        let numOfItems = collecView.numberOfItems(inSection: 0)
        
        for attr in atttis {
            if attr.representedElementCategory == .cell {
                
                if offsetY <= 0
                {
                    
                  let distance = fabs(offsetY)/8
                  attr.frame.origin.y += offsetY + distance * CGFloat(attr.indexPath.section + 1)
                    
                }else if(bottomOffset > 0)
                {
                
                  let distance = bottomOffset / 8
                  attr.frame.origin.y += bottomOffset - distance * CGFloat(numOfItems - attr.indexPath.section)
                
                }
            }
        }
        
       return atttis
    }
    
    
}
