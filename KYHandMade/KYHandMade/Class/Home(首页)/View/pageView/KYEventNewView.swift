//
//  KYEventNewView.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/19.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit


fileprivate let  KYEventNewViewCellId = "KYFocusCellId"
class KYEventNewView: UIView {


    private lazy var  collectionView : UICollectionView = {
    
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: SCREEN_WIDTH*0.43, height: SCREEN_WIDTH*0.43*1.25)
        let collView = UICollectionView(frame: self.bounds, collectionViewLayout:layout)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collView.backgroundColor = UIColor.white
        collView.dataSource = self
        collView.delegate = self
        collView.register(UINib(nibName:"KYSlideCollectionViewCell", bundle:nil), forCellWithReuseIdentifier: KYEventNewViewCellId)
        collView.mj_header = setupJianDaoHeaderRefresh(self, action: #selector(loadNewData))
        collView.mj_footer = setupFooterRefresh(self, action: #selector(loadMoreData))
        collView.mj_header?.beginRefreshing()
        return collView
    
    }()
    
    
    var shopModels = [KYSlideShopModel]()
    var param : String = ""
    var handId : String = ""
    
    var lastId : String?
    
    
   
    
    
    
    init(frame:CGRect,param:String,handId : String) {
        super.init(frame:frame)
        self.param = param
        self.handId = handId
        addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    @objc func loadNewData() {
        shopModels.removeAll()
        
        let paramet : [String : Any] = [
            
            "c" : "Competition" ,
            "a" : "getOpus",
            "cid" : handId,
            "order" : param,
            "vid" : "16"
        ]
        
        KYNetWorkTool.shared.get(HomeBaseURL, parameters: paramet) { (success, result, error) in
            
            self.collectionView.mj_header?.endRefreshing()
            if success{
                let data = result?["data"].arrayObject as? [[String : AnyObject]]
                
                guard let data2 = data else{
                    return
                }
                
                for dict in data2{
                    let eventModel = KYSlideShopModel(dict:dict)
                    self.shopModels.append(eventModel)
                }
                
                let shopModel = self.shopModels.last
                self.lastId = shopModel?.last_id
                self.collectionView.reloadData()
            }
            
        }
        
        
    }
    
    @objc func loadMoreData() {
        
        guard let lastEvenId = self.lastId else {
            return
        }
        
        let paramet : [String : Any] = [
            
            "c" : "Competition" ,
            "a" : "getOpus",
            "cid" : handId,
            "order" : param,
            "vid" : "16",
            "last_opus_id" : lastEvenId,
        ]
        
        KYNetWorkTool.shared.get(HomeBaseURL, parameters: paramet) { (success, result, error) in
            
            self.collectionView.mj_footer?.endRefreshing()
            
            if success{
                let data = result?["data"].arrayObject as? [[String : AnyObject]]
                
                guard let data2 = data else{
                    return
                }
                
                for dict in data2{
                    let shopModel = KYSlideShopModel(dict:dict)
                    self.shopModels.append(shopModel)
                }
                
                let shopModel = self.shopModels.last
                self.lastId = shopModel?.last_id
                self.collectionView.reloadData()
            }
        }
 
        
    }
    
}
extension KYEventNewView : UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let shopCell = collectionView.dequeueReusableCell(withReuseIdentifier: KYEventNewViewCellId, for: indexPath) as! KYSlideCollectionViewCell
        shopCell.slideShopModel = shopModels[indexPath.item]
        return shopCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
       // var rotation = CATransform3DMakeRotation( CGFloat(Double.pi/4), 0.0, 0.7, 0.4)
       var rotation = CATransform3DMakeTranslation(0, 50, 20)
        
        rotation = CATransform3DScale(rotation, 0.6, 0.6, 1)
        
        rotation.m34 = 1.0/1000
        
        cell.layer.shadowColor = UIColor.red.cgColor
        cell.layer.shadowOffset = CGSize(width: 10, height: 10)
        cell.alpha = 0
        
        cell.layer.transform = rotation
        
        UIView.beginAnimations("rotation", context: nil)
        
        UIView.setAnimationDuration(0.6)
        
        cell.layer.transform = CATransform3DIdentity
        cell.alpha = 1
        cell.layer.shadowOffset = CGSize(width: 0, height:0)
        
        UIView.commitAnimations()
    }
    
    
}

extension KYEventNewView : UICollectionViewDelegate{

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    

}

