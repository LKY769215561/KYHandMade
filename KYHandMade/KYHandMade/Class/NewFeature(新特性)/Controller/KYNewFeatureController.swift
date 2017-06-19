//
//  KYNewFeatureController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/8.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

let   featureCellId = "featureCell"

class KYNewFeatureController: UICollectionViewController {


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     collectionView?.register(UINib.init(nibName: "KYNewFeatureCell", bundle: nil), forCellWithReuseIdentifier: featureCellId)
     collectionView?.bounces = false
     collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.isPagingEnabled = true
        
        
    }
}

extension KYNewFeatureController{
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
    
        let kyCell = (collectionView.dequeueReusableCell(withReuseIdentifier: featureCellId, for: indexPath)) as! KYNewFeatureCell
        kyCell.featureImageView.image = UIImage(named : "newfeature_0\(indexPath.item+1)_736")
        return kyCell
    }
    
     // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
      
        if indexPath.item == 4 {
            
            UIApplication.shared.keyWindow?.rootViewController = KYAdViewController()
            let anim = CATransition()
            anim.type = "rippleEffect"
            anim.duration = 1
            UIApplication.shared.keyWindow?.layer.add(anim, forKey: nil)
        }
    }
}

