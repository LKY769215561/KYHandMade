//
//  KYNavgationController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/12.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYNavgationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

       UINavigationBar.appearance().barTintColor = UIColor(red: 0.92, green: 0.34, blue: 0.32, alpha: 1)
       // UINavigationBar.appearance().tintColor = UIColor.red
    }

}
extension KYNavgationController : UINavigationBarDelegate{

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        
        viewController.view.backgroundColor = UIColor.white
        viewController.automaticallyAdjustsScrollViewInsets = false
        
        
        if childViewControllers.count >= 1
        {
            viewController.hidesBottomBarWhenPushed = true;
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"Image"), style: .plain, target: self, action:#selector(back))
        }else
        {
            viewController.hidesBottomBarWhenPushed = false
        }
        
        
        
        super.pushViewController(viewController, animated: animated)
    }
    

    func back() {
        
        popViewController(animated: true)
        
    }
    
}

