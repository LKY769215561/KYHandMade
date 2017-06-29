//
//  KYMyTableViewController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/12.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

private let MyCellId = "MyCellId"

private let headViewHeight : CGFloat = 200

class KYMyViewController: UIViewController {

    
    fileprivate lazy var tableView : UITableView = {
      
       let tab = UITableView(frame: CGRect(x:0, y: 0, width:SCREEN_WIDTH, height:SCREEN_HEIGHT-NAVBAR_HEIGHT-TABBAR_HEIGHT), style: .grouped)
        tab.register(UINib(nibName:"KYMyCell", bundle:nil), forCellReuseIdentifier: MyCellId)
        tab.dataSource = self
        tab.delegate = self
        tab.tableHeaderView = self.headView
        return tab
    }()
    
    fileprivate lazy var headImageView : UIImageView = {
    
        let bgImageView = UIImageView(frame: CGRect(x:0, y: 0, width: SCREEN_WIDTH, height:headViewHeight))
        bgImageView.contentMode = .scaleAspectFill
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
    fileprivate lazy var headView : UIView = {
        let bgView = UIView(frame: CGRect(x:0, y: 0, width: SCREEN_WIDTH, height:headViewHeight))
        bgView.addSubview(self.headImageView)
        return bgView
    }()
    
    
    fileprivate lazy var titleLabel : UILabel = {
    
        let label =  UILabel()
        label.size = CGSize(width: 150, height: 44)
        label.center = CGPoint(x:SCREEN_WIDTH/2, y:44/2+20)
        label.text = "我的"
        label.textAlignment = .center
        return label
    }()
    
    
    fileprivate lazy var navigationView : UIView = {
      
        let barView = UIView(frame: CGRect(x:0, y:0, width: SCREEN_WIDTH, height:NAVBAR_HEIGHT))
        barView.backgroundColor = UIColor.white.withAlphaComponent(0.85)
        barView.addSubview(self.titleLabel)
        barView.alpha = 0
        return barView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        // 添加内容视图
        view.addSubview(tableView)
        
        
     
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 去掉背景图片 底部线条
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        view.addSubview(navigationView)
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
 
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentInset.top + scrollView.contentOffset.y
        let progressChange = offsetY / 80
        
        if offsetY < 0 {
            headImageView.y = offsetY
            headImageView.height = headViewHeight - offsetY
        }
        print(progressChange)
        
        if progressChange >= 1
        {
           self.navigationView.alpha = progressChange - 1
        }else
        {
           self.navigationView.alpha = 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        KYPageRouter.openAuthorWebView(webURL: authorBlog)
    }

}

