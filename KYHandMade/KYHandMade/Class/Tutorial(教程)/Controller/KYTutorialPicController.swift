//
//  GPTutorialPicController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/20.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit
import DOPDropDownMenu

private let KYTutorialPicCellId = "KYTutorialPicCellId"

class KYTutorialPicController: UIViewController {

    //  addMenuData
    
    var evenythingS = ["全部分类","两个字","三个字","四个字"]
    var twoSizeS = ["布艺","皮艺","纸艺","编织","饰品","木艺","刺绣","模型"]
    var thrreSizeS = ["羊毛毡","橡皮章"]
    var fourSizeS = ["黏土陶艺","园艺多肉","手绘印刷","手工护肤","美食烘焙","旧物改造","滴胶热缩","电子科技","雕塑雕刻","金属工艺"]
    var timeS = ["一周","一月","全部教程"]
    var hotS = ["最热教程","最新更新","评论最多","收藏最多","材料包有售","成品有售"]
    var evenythingImageS = ["sgk_course_cate_all"]
    var timeImageS = ["sgk_course_time_week","sgk_course_time_month","sgk_course_time_all"]
    var hotImageS = ["sgk_course_sort_new","sgk_course_sort_hot","sgk_course_sort_comment","sgk_course_sort_collect","sgk_course_sort_material","sgk_course_sort_product"]
    
    var gacate = "allcate"
    var cateId : String?
    var pubtime : String?
    var oreder : String?
    var lastId : String?
    
    
    lazy var picModels = [KYTutoriaPicModel]()
    
    
   lazy var  collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: SCREEN_WIDTH*0.43, height: SCREEN_WIDTH*0.43*1.5)
    
        let collView = UICollectionView(frame:CGRect(x:0, y:40, width:SCREEN_WIDTH, height:SCREEN_HEIGHT-40-NAVBAR_HEIGHT-TABBAR_HEIGHT), collectionViewLayout:layout)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collView.backgroundColor = UIColor.white
        collView.dataSource = self
        collView.delegate = self
        collView.register(UINib(nibName:"KYTutorialPicCell", bundle:nil), forCellWithReuseIdentifier: KYTutorialPicCellId)
        collView.mj_header = setupJianDaoHeaderRefresh(self, action: #selector(loadNewData))
        collView.mj_footer = setupFooterRefresh(self, action: #selector(loadMoreData))
        collView.mj_header?.beginRefreshing()
        return collView
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      let menu = DOPDropDownMenu(origin: CGPoint(x: 0, y: 0), andHeight: 40)!
      menu.dataSource = self
      menu.delegate = self
      view.addSubview(menu)
      menu.selectDefalutIndexPath()
        
        view.addSubview(collectionView)
    }
    
    @objc func loadNewData() {
    
        
        self.picModels.removeAll()


//        guard let oreder = oreder else {
//            return
//        }
        
//        guard let cateId = cateId else {
//            return
//        }
//        guard let pubtime = pubtime else {
//            return
//        }
        
        let paramet : [String : Any] = [
            
            "c" : "Course" ,
            "a" : "newCourseList" ,
            "gcate" : gacate,
            "order" : oreder ,
            "vid" : "18" ,
            "cate_id" : cateId ,
            "pub_time" : pubtime
        ]
        
        
       KYNetWorkTool.shared.get(HomeBaseURL, parameters: paramet) { (success, result, error) in
        
        self.collectionView.mj_header?.endRefreshing()
        if success{
        
            let data  = result?.dictionaryObject?["data"] as? [[String : AnyObject]]
            
            guard let picData = data else{
             return
            }
            
            for dict in picData{
                let darenModel = KYTutoriaPicModel(dict:dict)
                self.picModels.append(darenModel)
            }
            
            let lastPicModel = self.picModels.last
            self.lastId = lastPicModel?.last_id
            self.collectionView.reloadData()
        }
        }
    }
    
    @objc func loadMoreData() {
        

        
        let paramet : [String : Any] = [
            
            "c" : "Course" ,
            "a" : "newCourseList" ,
            "gcate" : gacate,
            "order" : oreder ,
            "vid" : "18" ,
            "cate_id" : cateId ,
            "last_id" : lastId ,
            "pub_time" : pubtime
            
        ]
        KYNetWorkTool.shared.get(HomeBaseURL, parameters: paramet) { (success, result, error) in
            
  
            if success{
                
                let data  = result?.dictionaryObject?["data"] as? [[String : AnyObject]]
                
                guard let picData = data else{
                    return
                }
                
                for dict in picData{
                    let darenModel = KYTutoriaPicModel(dict:dict)
                    self.picModels.append(darenModel)
                }
                
                let lastPicModel = self.picModels.last
                
                if lastPicModel?.last_id == nil
                {
                
                    self.collectionView.mj_footer?.endRefreshingWithNoMoreData()
                }else
                {
                     self.lastId = lastPicModel?.last_id
                    self.collectionView.mj_footer?.endRefreshing()
                }
                self.collectionView.reloadData()
            }
        }
    }

}
// MARK:UICollectionViewDataSource
extension KYTutorialPicController : UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picModels.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let picCell = collectionView.dequeueReusableCell(withReuseIdentifier: KYTutorialPicCellId, for: indexPath) as! KYTutorialPicCell
        picCell.picModel = picModels[indexPath.item]
        return picCell
    }
    
}
// MARK:UICollectionViewDelegate
extension KYTutorialPicController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let picModel = picModels[indexPath.item]
        let animator = XWCoolAnimator.xw_animator(with: .foldFromRight)
        let picVC = KYDaRenPicController(collectionViewLayout: UICollectionViewLayout())
        picVC.tagCpunt = picModel.hand_id
        xw_present(picVC, with: animator)
        
    }
}


// MARK:DOPDropDownMenuDataSource
extension KYTutorialPicController : DOPDropDownMenuDataSource{

    func numberOfColumns(in menu: DOPDropDownMenu!) -> Int {
        return 3
    }
    
    func menu(_ menu: DOPDropDownMenu!, numberOfRowsInColumn column: Int) -> Int {
        
        if  column == 0 {
            return evenythingS.count
        }else if column == 1{
        return timeS.count
        }else{
        return hotS.count
        }
        
    }
    
    func menu(_ menu: DOPDropDownMenu!, titleForRowAt indexPath: DOPIndexPath!) -> String! {
        if indexPath.column == 0 {
            return evenythingS[indexPath.row]
        }else if indexPath.column == 1{
         return timeS[indexPath.row]
        }else{
         return hotS[indexPath.row]
        }
    }

    func menu(_ menu: DOPDropDownMenu!, numberOfItemsInRow row: Int, column: Int) -> Int {
        
        if column == 0 {
            if row == 1 {
                return twoSizeS.count
            }else if row == 2{
            return thrreSizeS.count
            }else{
            return fourSizeS.count
            }
        }
        return 0
        
    }
    func menu(_ menu: DOPDropDownMenu!, titleForItemsInRowAt indexPath: DOPIndexPath!) -> String! {
        if indexPath.column == 0 {
            if indexPath.row == 1 {
                return twoSizeS[indexPath.item];
            }else if indexPath.row == 2{
                return thrreSizeS[indexPath.item];
            }else if indexPath.row == 3{
                return fourSizeS[indexPath.item];
            }
        }
        return nil;
    }
    
    
    
}
// MARK:DOPDropDownMenuDelegate
extension KYTutorialPicController : DOPDropDownMenuDelegate{

    func menu(_ menu: DOPDropDownMenu!, didSelectRowAt indexPath: DOPIndexPath!) {
        if (indexPath.column == 0) {
            gacate = "cate";
            if indexPath.row == 1 && indexPath.item >= 0 {
                cateId = "\(indexPath.item + 1)"
            }else if (indexPath.row == 2 && indexPath.item >= 0){
             cateId = "\(indexPath.item + 1 + twoSizeS.count)"
            }else if (indexPath.row == 3 && indexPath.item >= 0){
               cateId = "\(indexPath.item + 3 + twoSizeS.count)"
            }
            }else if(indexPath.column == 1){
            if (indexPath.row == 1) {
                pubtime = "month"
            }else if (indexPath.row == 2){
                pubtime = "all"
             }
            }else{
            if (indexPath.row >= 0) {
                let orederS = ["hot","new","comment","collect","material","goods"]
                oreder = orederS[indexPath.row];
            }
        }

    }
}

