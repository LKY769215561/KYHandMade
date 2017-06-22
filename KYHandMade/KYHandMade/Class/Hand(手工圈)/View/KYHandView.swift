//
//  KYHandView.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/22.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit


private let KYHandViewCellId = "KYHandViewCellId"

class KYHandView: UIView {


    var handType : String = "XXX"
    
    var handModels = [KYHandModel]()
    lazy var  tableView : UITableView = {
    
        let table = UITableView(frame: self.bounds, style: .plain)
        table.register(NSClassFromString("KYHandCell"), forCellReuseIdentifier: KYHandViewCellId)
        table.dataSource = self
        table.delegate = self
        table.mj_header = setupJianDaoHeaderRefresh(self, action: #selector(loadNewData))
        table.mj_footer = setupFooterRefresh(self, action: #selector(loadMoreData))
        return table
    }()
    
     init(frame: CGRect,handType:String) {
        super.init(frame: frame)
        self.handType = handType

        addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        print(self.handType+"toWindow")
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        print(self.handType+"toSuperview")
    }
    
    
    func loadNewData()  {
        
        let param : [String : Any] = [
        
          "c":"HandCircle",
          "a":"list",
          "order":"hot",
          "vid":"18",
          "cate_id":"1",
        ]
        
        
        KYNetWorkTool.shared.get(HomeBaseURL, parameters: param) { (success, result, error) in
            
            self.tableView.mj_header.endRefreshing()
            
            print(result?.dictionaryObject)
            
        }
        
        
        
        tableView.reloadData()
    }
    func loadMoreData()  {
        
        tableView.reloadData()
    }
}

extension KYHandView : UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  handModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: KYHandViewCellId) as! KYHandCell
        cell.handModel = handModels[indexPath.row]
        return cell
    }
    
}

extension KYHandView : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


