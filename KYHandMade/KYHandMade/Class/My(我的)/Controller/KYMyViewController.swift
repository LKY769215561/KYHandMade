//
//  KYMyTableViewController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/12.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

private let MyCellId = "MyCellId"

class KYMyViewController: UIViewController {

    
    private lazy var tableView : UITableView = {
      
       let tab = UITableView(frame: CGRect(x:0, y: NAVBAR_HEIGHT, width:SCREEN_WIDTH, height:SCREEN_HEIGHT-NAVBAR_HEIGHT-TABBAR_HEIGHT), style: .grouped)
        tab.register(UINib(nibName:"KYMyCell", bundle:nil), forCellReuseIdentifier: MyCellId)
        tab.dataSource = self
        tab.delegate = self
        tab.tableHeaderView = self.headView
        return tab
    }()
    
    fileprivate lazy var headView : UIImageView = {
    
        let bgImageView = UIImageView(frame: CGRect(x:0, y: 0, width: SCREEN_WIDTH, height:200))
        bgImageView.image = UIImage(named:"me_BG")

        let authouImageView = UIImageView(image :  UIImage(named:"author"))
        authouImageView.size = CGSize(width: 90, height: 90)
        authouImageView.center = CGPoint(x:SCREEN_WIDTH/2, y: 80)
        authouImageView.layer.cornerRadius = authouImageView.width/2
        authouImageView.clipsToBounds = true
        authouImageView.backgroundColor = UIColor.red
        authouImageView.layer.borderWidth = 1
        authouImageView.layer.borderColor = UIColor.orange.cgColor
        bgImageView.addSubview(authouImageView)
        
        return bgImageView
    
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        
        
     
        
    }
    

    


}

extension KYMyViewController : UITableViewDataSource{
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1{
            return 3
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MyCellId) as! KYMyCell
        
        let imageSize = CGSize(width: 30, height: 30)
        
        if indexPath.section == 0 {
           
              cell.leftImageView.image = scaledToSize(image:UIImage(named:"我的订单"), size:imageSize )
               cell.subLabel.text = "我的订单";
            
        }else if indexPath.section == 1{
        
            if indexPath.row == 0 {
                cell.leftImageView.image = scaledToSize(image: UIImage(named:"我的优惠券"), size: imageSize)
               cell.subLabel.text = "我的优惠券";
                
            }else if indexPath.row == 1{
                cell.leftImageView.image = scaledToSize(image: UIImage(named:"积分商城"), size: imageSize)
               cell.subLabel.text = "积分商城";
                
            }else{
                cell.leftImageView.image = scaledToSize(image: UIImage(named:"活动中心"), size: imageSize)
               cell.subLabel.text = "活动中心";
        
            }
            
        }else if indexPath.section == 2{
            cell.leftImageView.image = scaledToSize(image: UIImage(named:"常见问题"), size: imageSize)
               cell.subLabel.text = "常见问题";
        }
        
        return cell
        
    }
    
}
extension KYMyViewController : UITableViewDelegate{
 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

}

