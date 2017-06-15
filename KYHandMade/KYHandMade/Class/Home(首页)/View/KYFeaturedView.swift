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

    // 头部
    lazy var featureHeader : UIView = {
      
        let headerHeight = SCREEN_HEIGHT * 0.25 + SCREEN_WIDTH/4 + SCREEN_WIDTH/2 + 40
        let header = UIView(frame:CGRect(x:0, y:0, width: SCREEN_WIDTH, height:headerHeight))
        return header
    }()
    
    // 轮播图  高度 SCREEN_HEIGHT * 0.25
    lazy var cycleScorllView : SDCycleScrollView = {
        let featureModel = self.featureDataModel!
       let  cycleView = SDCycleScrollView(frame: CGRect(x:0, y:0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT * 0.25), delegate: self, placeholderImage: UIImage(named: "2"))!
  
        var images  = [String]()
        for slideModel in featureModel.dataSlides{
            guard let imageURL = slideModel.host_pic else{
                continue
            }
            images.append(imageURL)
        }
        cycleView.currentPageDotColor = UIColor.red
        cycleView.imageURLStringsGroup = images
        
        return cycleView
    }()
 
    // 导航栏4个  高度 SCREEN_WIDTH/4
    lazy var navgtionView : UIView = {
    
        let featureModel = self.featureDataModel!
        let navgationItemW = SCREEN_WIDTH/4
        let navView = UIView(frame: CGRect(x:0, y:self.cycleScorllView.bottom, width: SCREEN_WIDTH, height:navgationItemW))
        for ( i,navgationModel) in featureModel.dataNavigationArray.enumerated() {
            
 
            let navgationItem = Bundle.main.loadNibNamed("KYNavigationView", owner: nil, options: nil)?.first as! KYNavigationView
            navgationItem.tag = i
            navgationItem.frame = CGRect(x:CGFloat(i)*navgationItemW, y:0, width: navgationItemW, height:navgationItemW)
            navgationItem.navgationModel = navgationModel
            navView.addSubview(navgationItem)
        }
        return navView
    }()
    
    // 提示框两个 SCREEN_WIDTH/2
    lazy var advanceView : UIView = {
    
        let adView = UIView(frame:CGRect(x:0, y:self.navgtionView.bottom, width: SCREEN_WIDTH, height:SCREEN_HEIGHT * 0.25))
    
        let featureModel = self.featureDataModel!
        let advanceItemW = SCREEN_WIDTH/2
        let navView = UIView(frame: CGRect(x:0, y:self.cycleScorllView.bottom, width: SCREEN_WIDTH, height:advanceItemW))

        for ( i,advanceModel) in featureModel.dataAdvanceArray.enumerated() {
            let advanceItem = Bundle.main.loadNibNamed("KYAdvanceView", owner: nil, options: nil)?.first as! KYAdvanceView
            advanceItem.tag = i
            advanceItem.frame = CGRect(x:CGFloat(i)*advanceItemW, y:0, width: advanceItemW, height:advanceItemW)
            advanceItem.advanceModel = advanceModel
            adView.addSubview(advanceItem)
        }
        return adView
        
    
    }()
    
    // 热门专题   高度40
    lazy var hotTopicView : UIView = {
    
        let hotView = UIView(frame:CGRect(x:0, y:self.advanceView.bottom, width: SCREEN_WIDTH, height:40))
        hotView.backgroundColor = UIColor.white
        let centerLabel = UILabel(frame:CGRect(x:0, y:24, width: SCREEN_WIDTH, height:1))
        centerLabel.backgroundColor = UIColor.lightGray
        hotView.addSubview(centerLabel)
        
        let labelText = "热门专题"
        let textLabel = UILabel(frame:CGRect(x:150, y:10, width:100, height:30))
        textLabel.textColor = UIColor.black
        textLabel.backgroundColor = UIColor.white
        textLabel.textAlignment = .center
        textLabel.text = labelText
        hotView.addSubview(textLabel)
        return hotView
    }()
    
    
    var featureDataModel : KYFeaturedModel?
    
      fileprivate lazy var tableView : UITableView = {
     
      let tabView = UITableView(frame: self.bounds, style: .plain)
      tabView.mj_header = setupJianDaoHeaderRefresh(self, action: #selector(loadNewData))
      tabView.tableHeaderView = self.featureHeader    //防止头部不跟随滚动
        
      tabView.dataSource = self
      tabView.delegate = self
      tabView.register(UINib(nibName:"KYFeaturedCell", bundle:nil), forCellReuseIdentifier: KYFeaturedViewCellId)
      return tabView
    
    }()
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        addSubview(tableView)
        
        tableView.mj_header.beginRefreshing()
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
            
            
            self.AddheadSubView()
                
            self.tableView.reloadData()
            
           }
            else
           {
            
           }
         
            
        }
        
        
    }
    
    func AddheadSubView() {
        
        featureHeader.addSubview(cycleScorllView)
        featureHeader.addSubview(navgtionView)
        featureHeader.addSubview(advanceView)
        featureHeader.addSubview(hotTopicView)
    }
 
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

// MARK:UITableViewDataSource
extension KYFeaturedView : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let hotCount = featureDataModel?.dataHotArray.count else {
            return 0
        }
        return hotCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let hotModel = featureDataModel?.dataHotArray[indexPath.row]
        
        
        let featureCell = tableView.dequeueReusableCell(withIdentifier: KYFeaturedViewCellId)! as! KYFeaturedCell
        featureCell.hotData = hotModel
        return  featureCell
        
    }
}

// MARK:UITableViewDelegate

extension KYFeaturedView : UITableViewDelegate{
  

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var rotation = CATransform3DMakeRotation( CGFloat(Double.pi/4), 0.0, 0.7, 0.4)
        
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
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREEN_HEIGHT * 0.25
    }
    

}
