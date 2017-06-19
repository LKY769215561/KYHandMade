//
//  KYEventView.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/13.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit


fileprivate let KYEventViewCellId = "KYEventViewCellId"


class KYEventView: UIView {
    
    fileprivate lazy var tableView : UITableView = {
        
        let tableView = UITableView(frame:self.bounds, style: .plain)
        tableView.rowHeight = 190
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName:"KYEventCell", bundle :nil), forCellReuseIdentifier: KYEventViewCellId)
        tableView.mj_header = setupJianDaoHeaderRefresh(self, action: #selector(loadNewData))
        tableView.mj_footer = setupFooterRefresh(self, action: #selector(loadMoreData))
        tableView.mj_header.beginRefreshing()
        return tableView
    }()
    
    var laseId : String?
    
    var eventModels = [KYEventModel]()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadNewData () {
        
        eventModels.removeAll()
        
        let paramet : [String : Any] = [
            
            "c" : "Course" ,
            "vid" : "18",
            "a" : "activityList"
        ]
        
        KYNetWorkTool.shared.get(HomeBaseURL, parameters: paramet) { (success, result, error) in
           
            self.tableView.mj_header.endRefreshing()
            
            if success{
                let data = result?["data"].arrayObject as? [[String : AnyObject]]
                
                guard let data2 = data else{
                    return
                }
                
                for dict in data2{
                    let eventModel = KYEventModel(dict:dict)
                    self.eventModels.append(eventModel)
                }
                
                let eventModel = self.eventModels.last
                self.laseId = eventModel?.Id
                self.tableView.reloadData()
            }

            
        }
        
        
        
    }
    
    func loadMoreData () {

        guard let lastEvenId = self.laseId else {
            return
        }
        
        let paramet : [String : Any] = [
            
            "c" : "Course" ,
            "vid" : "18",
            "a" : "activityList",
            "id" : lastEvenId
        ]
        KYNetWorkTool.shared.get(HomeBaseURL, parameters: paramet) { (success, result, error) in
            
            self.tableView.mj_footer.endRefreshing()
            
            if success{
                let data = result?["data"].arrayObject as? [[String : AnyObject]]
                
                guard let data2 = data else{
                    return
                }
                
                for dict in data2{
                    let eventModel = KYEventModel(dict:dict)
                    self.eventModels.append(eventModel)
                }
                
                let eventModel = self.eventModels.last
                self.laseId = eventModel?.Id
                self.tableView.reloadData()
            }
        }
    }
}

extension KYEventView : UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let eventCell = tableView.dequeueReusableCell(withIdentifier: KYEventViewCellId) as! KYEventCell
        eventCell.eventModel = eventModels[indexPath.row]
        return eventCell
    }
    
    
}

extension KYEventView : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let eventModel = eventModels[indexPath.row]
        
        let slidVC = KYSlideEventController()
         slidVC.handId = eventModel.c_id
      KYPageRouter.getCurrentNav()?.pushViewController(slidVC, animated: true)
    }

}


