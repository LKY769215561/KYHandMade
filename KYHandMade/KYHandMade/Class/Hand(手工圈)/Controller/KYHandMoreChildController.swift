//
//  KYHandMoreChildController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/7/7.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYHandMoreChildController: UIViewController {

    
   lazy var closeBtn : UIButton = {
    
        let btn = UIButton(type : .custom)
        btn.frame = CGRect(x:SCREEN_WIDTH-40, y:NAVBAR_HEIGHT, width: 40, height: 40)
        btn.backgroundColor = UIColor.lightGray
        btn.addTarget(self, action: #selector(popAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var collectionView : UICollectionView = {
    
        let collView = UICollectionView(frame: CGRect(x:0, y: NAVBAR_HEIGHT, width: SCREEN_WIDTH, height:SCREEN_HEIGHT-NAVBAR_HEIGHT), collectionViewLayout: UICollectionViewFlowLayout())
        collView.dataSource = self
        collView.delegate = self
        return collView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        navigationItem.title = "编辑圈子"
        view.addSubview(closeBtn)
        view.addSubview(collectionView)
        
    }
    

    func popAction() {
        
       dismiss(animated: true, completion: nil)
    }
    

}
extension KYHandMoreChildController : UICollectionViewDataSource{

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
extension KYHandMoreChildController : UICollectionViewDelegate{

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath.item)
    }
    
}


