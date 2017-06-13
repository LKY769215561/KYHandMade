//
//  KYHomeView.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/13.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit



let KYFeaturedViewCellId = "KYFeaturedViewCellId"
class KYFeaturedView: UIView {


    
      
    
    var featureData : KYFeaturedData?
    
    
    
      fileprivate lazy var tableView : UITableView = {
     
      let tableView = UITableView(frame: self.bounds, style: .plain)
      tableView.mj_header = setupHeaderRefresh(self, action: #selector(loadNewData))
      tableView.mj_footer = setupFooterRefresh(self, action: #selector(loadMoreData))
      tableView.mj_header.beginRefreshing()
  
      
        
      tableView.dataSource = self
      tableView.delegate = self
      tableView.register(KYFeaturedCell.self, forCellReuseIdentifier: KYFeaturedViewCellId)
      return tableView
    
    }()
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        addSubview(tableView)
        
   
        
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
            
             let data = (result?.dictionaryObject?["data"]) as? Dictionary
            
            guard let featureData = data else{
            return
            }
            
             self.featureData = fe
            
           }
            else
           {
            
            }
         
            
        }
        
        
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

extension KYFeaturedView : UITableViewDelegate{
  
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

}
