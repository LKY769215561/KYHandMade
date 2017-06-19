//
//  KYFocusView.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/13.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit
import SnapKit


fileprivate let  KYFocusCellId = "KYFocusCellId"

class KYFocusView: UIView {

   
    lazy var collectionView : UICollectionView = {
        let layout = KYLayout()
        layout.itemSize = CGSize(width: SCREEN_WIDTH-20, height: SCREEN_HEIGHT*0.3)
        let collView = UICollectionView(frame: self.bounds, collectionViewLayout:layout)
        collView.dataSource = self
        collView.delegate = self
        collView.register(UINib(nibName:"KYFocusCell", bundle:nil), forCellWithReuseIdentifier: KYFocusCellId)
        return collView
    
    }()
    
    var focusModels = [KYFocusModel]()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadfocusData()
        addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
   @objc private func  loadfocusData() {
        
        focusModels.removeAll()
        
        let focesModesDict : [Any] = [
        
            ["iconStr":"001","contentImage":"01","nameStr":"我是小菜蛋对你点赞了","contenStr":"哈哈哈哈,下拉&点击有惊喜呀,要不要试一试呢"],
            ["iconStr":"002","contentImage":"02","nameStr":"我是小菜蛋关注了你","contenStr":"暗恋的女孩告诉我，如果我喜欢她就别说出来，因为愿望说出来就不灵了。这道理我懂!"],
            ["iconStr":"003","contentImage":"03","nameStr":"我是小菜蛋求你赏个赞呗","contenStr":"你现在不喜欢我，我告诉你，过了这个村，我在下一个村等你!!"],
            ["iconStr":"004","contentImage":"04","nameStr":"我是小菜蛋求你给个关注呗","contenStr":"我姓黄，又在秋天出生，所以我叫黄天出"],
            ["iconStr":"005","contentImage":"05","nameStr":"我是小菜蛋祝你发大财","contenStr":"哈哈哈,上拉&点击也有惊喜"]
        ]
  
        for  focusDict in focesModesDict {
            
            let focusModel = KYFocusModel(dict:focusDict as! [String : AnyObject])
            focusModels.append(focusModel)
        }
        collectionView.reloadData()
    }
}

extension KYFocusView : UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  focusModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let focuesCell = collectionView.dequeueReusableCell(withReuseIdentifier: KYFocusCellId, for: indexPath) as! KYFocusCell
        focuesCell.focusModel = focusModels[indexPath.item]
        return focuesCell
    }
    
}

extension KYFocusView : UICollectionViewDelegate{

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item % 2 == 0
        {
             KYCommonTool.openUrl(str:authorBlog)
        }else
        {
            KYCommonTool.openUrl(str: authorGithub)
        }
        
    }
}

