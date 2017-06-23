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
        table.estimatedRowHeight = 200
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
        
//        let param : [String : Any] = [
//        
//          "c":"HandCircle",
//          "a":"list",
//          "order":"hot",
//          "vid":"18",
//          "cate_id":"1",
//        ]
//        
//        
//        KYNetWorkTool.shared.get(HomeBaseURL, parameters: param) { (success, result, error) in
//            
//            self.tableView.mj_header.endRefreshing()
//            
//            print(result?.dictionaryObject)
//            
//        }
        
        
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { 
        
            self.tableView.mj_header.endRefreshing()
        
            let filePath = Bundle.main.path(forResource: "handData.json", ofType: nil, inDirectory: nil, forLocalization: nil)
            guard let filePath2 = filePath else{
                return
            }
            let data = NSData(contentsOfFile: filePath2)
            let result = KYCommonTool.dataToObj(data: data) as! [String : AnyObject]
            let dictList = result["data"]?["list"] as! [[String : AnyObject]]
            for dict in dictList{
                let handModel =  KYHandModel(dict : dict)
                self.handModels.append(handModel)
            }
            self.tableView.reloadData()
        }
        
        
       
    }
    func loadMoreData()  {
        
        tableView.mj_footer.endRefreshing()
        tableView.reloadData()
    }
}

extension KYHandView : UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  handModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: KYHandViewCellId) as? KYHandCell
        
        if cell == nil {
            cell = KYHandCell(style: .default, reuseIdentifier: KYHandViewCellId)
        }
        cell?.handModel = handModels[indexPath.row]
        return cell!
    }
    
}

extension KYHandView : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight(for: indexPath, cellContentViewWidth: SCREEN_WIDTH, tableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


