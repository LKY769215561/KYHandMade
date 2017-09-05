//
//  KYDaRenView.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/13.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit


let KYDarenCellId = "KYDarenCellId"

class KYDaRenView: UIView {

   fileprivate lazy var tableView : UITableView = {
     
       let tableView = UITableView(frame:self.bounds, style: .plain)
        tableView.rowHeight = 200
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName:"KYDarenCell", bundle :nil), forCellReuseIdentifier: KYDarenCellId)

        //tableView.registerCell(KYDarenCell.self)
        tableView.mj_header = setupJianDaoHeaderRefresh(self, action: #selector(loadNewData))
        tableView.mj_footer = setupFooterRefresh(self, action: #selector(loadMoreData))
        tableView.mj_header.beginRefreshing()
        return tableView
    }()
    
   lazy var darenModels = [KYDaRenModel]()
    var lastTimeId : String?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    
        addSubview(tableView)
        
    }
    
    
    func loadNewData() {
        
        
        darenModels.removeAll()
        
        let paramet : [String : Any] = [
            
            "act" : "up" ,
            "vid" : "18"
        ]
    
        KYNetWorkTool.shared.post(HomeDarenURL, parameters: paramet) { (success, result, error) in
         
            self.tableView.mj_header.endRefreshing()
            
            if success
            {
                let data = result?["data"].arrayObject as? [[String : AnyObject]]
                
                guard let data2 = data else{
                    return
                }
                
                for dict in data2{
                    let darenModel = KYDaRenModel(dict:dict)
                    self.darenModels.append(darenModel)
                }
                
                let darenModel = self.darenModels.last
                self.lastTimeId = darenModel?.course_time
                self.tableView.reloadData()
                
            }
            
        }
        
    }
    
    func loadMoreData() {
        let paramet : [String : Any] = [
            
            "act" : "down" ,
            "vid" : "18"  ,
            "last_id" : ""
        ]
        
        KYNetWorkTool.shared.post(HomeDarenURL, parameters: paramet) { (success, result, error) in
            
            self.tableView.mj_footer.endRefreshing()
            
            if success
            {
                let infoStr =  (result?["info"].stringValue)!
                if (infoStr as NSString).length > 0
                {
                   KYProgressHUD.showInfoWithStatus(infoStr)
                }else
                {
                    let data = result?["data"].arrayObject as? [[String : AnyObject]]
                    guard let data2 = data else{
                        return
                    }
                    
                    
                    for dict in data2{
                        let darenModel = KYDaRenModel(dict:dict)
                        self.darenModels.append(darenModel)
                    }
                    let darenModel = self.darenModels.last
                    self.lastTimeId = darenModel?.course_time
                    self.tableView.reloadData()
                }

            }
            
        }

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension KYDaRenView : UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return darenModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       // let darenCell = tableView.dequeueReusableCell(indexPath: indexPath) as KYDarenCell
        let darenCell = tableView.dequeueReusableCell(withIdentifier:KYDarenCellId , for: indexPath) as! KYDarenCell
        darenCell.darenModel = darenModels[indexPath.row]
        return darenCell
        
    }
    
    
}

extension KYDaRenView : UITableViewDelegate{


}


