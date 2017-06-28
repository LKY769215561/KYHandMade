//
//  KYFairTableViewController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/12.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

private let  KYFariId = "FariCellId";
private let  KYFariBestId = "FairBestCellId";
private let  KYFariTopicBestId = "FariTopicBestCellId";
private let  KYFariTopicId = "FariTopicCellId";
private let  KYFairHeadID = "FairHeadViewId";

class KYFairTableViewController: UIViewController {


    
    var fariDataModel : KYFariDataModel?
    
    
    private lazy var collectionView : UICollectionView = {
    
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        let collView = UICollectionView(frame: CGRect(x:0, y:NAVBAR_HEIGHT, width: SCREEN_WIDTH, height:SCREEN_HEIGHT-NAVBAR_HEIGHT-TABBAR_HEIGHT), collectionViewLayout:layout)
        collView.backgroundColor = UIColor.white
        collView.dataSource = self
        collView.delegate = self
        collView.register(UINib(nibName:"KYFairHotCell", bundle:nil), forCellWithReuseIdentifier: KYFariId)
        collView.register(UINib(nibName:"KYFairBestCell", bundle:nil), forCellWithReuseIdentifier: KYFariBestId)
        collView.register(UINib(nibName:"KYFariTopicBestCell", bundle:nil), forCellWithReuseIdentifier: KYFariTopicBestId)
        collView.register(UINib(nibName:"KYFariTopicCell", bundle:nil), forCellWithReuseIdentifier: KYFariTopicId)
        collView.register(UINib(nibName:"KYFairSectionHeadView",bundle:nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: KYFairHeadID)
        collView.mj_header = setupJianDaoHeaderRefresh(self, action: #selector(loadNewData))
        collView.mj_footer = setupFooterRefresh(self, action: #selector(loadMoreData))
        collView.mj_header.beginRefreshing()
        return collView
        
    
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     view.addSubview(collectionView)
        
    }

    func loadNewData() {
        
        let param : [String : Any] = [
         
                "c":"Shiji",
                "vid":"18",
                "a":"product"
        ]
        KYNetWorkTool.shared.get(HomeBaseURL, parameters: param) { (success, result, error) in
            
            self.collectionView.mj_header.endRefreshing()
            
            if success{
            
                let data = result?.dictionary?["data"]?.dictionaryObject as [String : AnyObject]?
                guard let data2 = data else{
                    KYProgressHUD.showWithStatus("数据为空")
                  return
                }
                
                self.fariDataModel = KYFariDataModel(dict : data2)
                self.collectionView.reloadData()

            }
        }
        
    }
    
    func loadMoreData() {
        
        
        guard let lastId = fariDataModel?.last_id else {
            KYProgressHUD.showWithStatus("没有更多数据啦。。。")
            collectionView.mj_footer.endRefreshingWithNoMoreData()
            return
        }
        
        let param : [String : Any] = [
            
            "c":"Shiji",
            "vid":"18",
            "last_id": lastId,
            "a":"topicList"
        ]
        
        KYNetWorkTool.shared.get(HomeBaseURL, parameters: param) { (success, result, error) in
            
            self.collectionView.mj_footer.endRefreshing()
            
            if success{
                
                let data = result?.dictionary?["data"]?.arrayObject as? [[String : AnyObject]]
                guard let data2 = data else{
                    KYProgressHUD.showWithStatus("数据为空")
                    return
                }
                
                for dict in data2{
                 let topicModel = KYFariTopicDataModel(dict :dict)
                 self.fariDataModel?.topicArray.append(topicModel)
                }
                self.collectionView.reloadData()
                
            }
        }
        
        
    }
    
}

extension KYFairTableViewController : UICollectionViewDataSource{

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        guard let dataModel = fariDataModel else {
            return 0
        }
        
        if section == 0 {
            return dataModel.hotArray.count
        }else if section == 1{
            return dataModel.bestArray.count
        }else if section == 2{
            return dataModel.topicBestArray.count
        }else{
            return dataModel.topicArray.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            
           let hotCell = collectionView.dequeueReusableCell(withReuseIdentifier: KYFariId, for: indexPath) as! KYFairHotCell
           hotCell.hotModel = fariDataModel?.hotArray[indexPath.item]
           return hotCell
            
        }else if indexPath.section == 1{
            
            let bestCell = collectionView.dequeueReusableCell(withReuseIdentifier: KYFariBestId, for: indexPath) as! KYFairBestCell
            bestCell.bestModel = fariDataModel?.bestArray[indexPath.item]
            return bestCell
        
        }else if indexPath.section == 2{
            
            let topicBestCell = collectionView.dequeueReusableCell(withReuseIdentifier: KYFariTopicBestId, for: indexPath) as! KYFariTopicBestCell
            topicBestCell.picStr = fariDataModel?.topicBestArray[indexPath.item]
            return topicBestCell
            
        }else{
        
            let topicCell = collectionView.dequeueReusableCell(withReuseIdentifier: KYFariTopicId, for: indexPath) as! KYFariTopicCell
            topicCell.topicModel = fariDataModel?.topicArray[indexPath.item]
            return topicCell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: KYFairHeadID, for: indexPath) as! KYFairSectionHeadView
       
        if indexPath.section == 1 {
            headView.titleLabel.text = "每日特价"
            headView.subtitleLabel.text = "每日10:00更新"
       
        }else if indexPath.section == 2{
        
            headView.titleLabel.text = "热门频道"
            headView.subtitleLabel.text = "更多"

        }
        return headView
    }
}
extension KYFairTableViewController : UICollectionViewDelegate{

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            
            KYPageRouter.openAuthorWebView(webURL: authorBlog)
            
        }else if indexPath.section == 1{
            
             KYPageRouter.openAuthorWebView(webURL: authorGithub)
        
        }else if indexPath.section == 2{
             KYPageRouter.openAuthorWebView(webURL: authorBlog)
        }else if indexPath.section == 3{
            
            let topicModel = fariDataModel?.topicArray[indexPath.item]
            let animator = XWCoolAnimator.xw_animator(with: .pageMiddleFlipFromRight)
            let webVC = KYWebViewController()
            webVC.isPush = false
            webVC.topicModel = topicModel
            KYPageRouter.getCurrentVC().xw_present(webVC, with: animator)
        }
    }
}



// UICollectionView 布局   每一组item  大小
extension KYFairTableViewController : UICollectionViewDelegateFlowLayout{
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        var W : CGFloat = 0
        var H : CGFloat = 0
        
        if indexPath.section == 0 {
            W = SCREEN_WIDTH * 0.2
            H = W * 1.4
        }else if indexPath.section == 1{
            W = SCREEN_WIDTH * 0.27
            H = W * 1.5
        }else if indexPath.section == 2{
            W = SCREEN_WIDTH * 0.27
            H = W
        }else if indexPath.section == 3{
            W = SCREEN_WIDTH * 0.94
            H = W * 0.6
        }
        return CGSize(width: W, height: H)
    }
    
    // 每一组头的尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 1{
         return CGSize(width: SCREEN_WIDTH, height: 40)
        }else if section == 2{
           return CGSize(width: SCREEN_WIDTH, height: 40)
        }
        return CGSize(width: 0, height: 0)
    }

}


















