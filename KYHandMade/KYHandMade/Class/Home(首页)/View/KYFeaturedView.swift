//
//  KYHomeView.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/13.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit
import SDCycleScrollView


let KYFeaturedViewCellId = "KYFeaturedViewCellId"
class KYFeaturedView: UIView {


    lazy var featureHeader : UIView = {
    
        let header = UIView()
        
    header.backgroundColor = UIColor.blue
          return header
    }()
    
    var cycleScorllView : SDCycleScrollView?
    
    
    
    var featureDataModel : KYFeaturedModel?
    
    
    
      fileprivate lazy var tableView : UITableView = {
     
      let tabView = UITableView(frame: self.bounds, style: .plain)
      tabView.mj_header = setupJianDaoHeaderRefresh(self, action: #selector(loadNewData))
      tabView.mj_footer = setupFooterRefresh(self, action: #selector(loadMoreData))
      
      
      
        
      tabView.dataSource = self
      tabView.delegate = self
      tabView.register(KYFeaturedCell.self, forCellReuseIdentifier: KYFeaturedViewCellId)
      return tabView
    
    }()
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        addSubview(tableView)
        
        tableView.mj_header.beginRefreshing()

        
    }
    
    func loadMoreData() {
        
        
        
    }
    
    
    func loadNewData() {
        
        let paramet : [String : AnyObject] = [
         
            "c" : "index" as AnyObject,
            "a" : "indexNewest" as AnyObject,
            "vid" : "18" as AnyObject
        ]
        
        
        KYNetWorkTool.shared.get(HomeBaseURl, parameters: paramet) { (success, result, error) in
            
            self.tableView.mj_header.endRefreshing()
            
            if success
            {
             let data = result?["data"].dictionaryObject as [String : AnyObject]?
             guard let featureData  = data else{
              return
            }
            
            self.featureDataModel = KYFeaturedModel(dict:featureData)
            
            
            self.AddSDCycleView()
            
           }
            else
           {
            
          }
         
            
        }
        
        
    }
    
    func AddSDCycleView() {
        
        guard let featureModel = featureDataModel else {
            return
        }
        cycleScorllView = SDCycleScrollView(frame: CGRect(x:0, y:0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT * 0.25), delegate: self, placeholderImage: UIImage(named: "2"))
        var images  = [String]()
        for slideModel in featureModel.dataSlides{
          
            guard let imageURL = slideModel.host_pic else{
              continue
            }
            images.append(imageURL)
        
        }
        cycleScorllView?.currentPageDotColor = UIColor.red
        cycleScorllView?.imageURLStringsGroup = images
        featureHeader.addSubview(cycleScorllView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension KYFeaturedView : UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let featureCell = tableView.dequeueReusableCell(withIdentifier: KYFeaturedViewCellId)!
 
        return  featureCell
        
    }
    
    
    
}

// MARK: - SDCycleScrollViewDelegate
extension KYFeaturedView: SDCycleScrollViewDelegate {
    
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
       
        let slide = featureDataModel?.dataSlides[index]
        
        guard let slideModel = slide else {
            return
        }
        
        if slideModel.itemtype == "class_special" || slideModel.itemtype == "topic_detail_h5" {
        
         let webVC = UIStoryboard(name:"KYWebViewController", bundle: nil).instantiateInitialViewController() as! KYWebViewController
         webVC.slide = slideModel
         KYPageRouter.getCurrentNav()?.pushViewController(webVC, animated: true)
        }else if(slideModel.itemtype == "event"){
        
            let eventVC = KYSlideEventController()
            eventVC.slide = slideModel
            KYPageRouter.getCurrentNav()?.pushViewController(eventVC, animated: true)
            
        }else if(slideModel.itemtype == "web_out"){
            
            guard let urlStr = slideModel.hand_id else {
                return
            }
            let url = URL(string:urlStr)
            
            guard let url2 = url else {
                return
            }
            UIApplication.shared.openURL(url2)
        }else{
            let lessonVC = KYSlideLessonController()
            lessonVC.slide = slideModel
            KYPageRouter.getCurrentNav()?.pushViewController(lessonVC, animated: true)
        }
    }
}


extension KYFeaturedView : UITableViewDelegate{
  
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return featureHeader
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        var rotation = CATransform3DMakeRotation(CGFloat(M_PI_4), 0.0, 0.7, 0.4)
        
        rotation = CATransform3DScale(rotation, 0.8, 0.8, 1)
        
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
