//
//  KYHandMoreChildController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/7/7.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit


private let itemSize = CGSize(width:(SCREEN_WIDTH - 50) * 0.25, height: 40)
private let MoreChildCellId = "MoreChildCellId"
private let MoreChildHeaderView = "MoreChildHeaderView"

class KYHandMoreChildController: UIViewController {

    
   lazy var closeBtn : UIButton = {
    
        let btn = UIButton(type : .custom)
        btn.frame = CGRect(x:SCREEN_WIDTH-50, y:NAVBAR_HEIGHT, width: 40, height: 40)
        btn.backgroundColor = UIColor.lightGray
        btn.addTarget(self, action: #selector(popAction), for: .touchUpInside)
        btn.setBackgroundImage(UIImage(named:"close"), for: .normal)
        return btn
    }()
    
    lazy var collectionView : UICollectionView = {
    
        let layout = LXReorderableCollectionViewFlowLayout()
        layout.itemSize = itemSize
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collView = UICollectionView(frame: CGRect(x:0, y: NAVBAR_HEIGHT, width: SCREEN_WIDTH, height:SCREEN_HEIGHT-NAVBAR_HEIGHT), collectionViewLayout: layout)
        collView.register(UINib(nibName:"KYHandMoreCell", bundle: nil), forCellWithReuseIdentifier: MoreChildCellId)
        collView.register(UINib(nibName:"KYHandMoreHeadView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: MoreChildHeaderView)
        collView.dataSource = self
        collView.delegate = self
        collView.backgroundColor = UIColor.lightGray
        collView.showsVerticalScrollIndicator = false
        collView.contentInset = UIEdgeInsetsMake(0, 0,5, 0)
        return collView
    }()
    
    
    lazy var moreChildArray : [String] = ["综合圈","布艺","皮艺","木艺","编织","饰品","文艺","刺绣","模型","羊毛毡","橡皮章","黏土陶艺","园艺多肉","手绘印刷","手工护肤","美食烘焙","旧物改造","滴胶热缩","电子科技","雕塑雕刻","金属工艺","文玩设计","玉石琥珀","游泳池","沙龙活动","古风首饰","服装裁剪","以物易物","亲子手工","护肤美妆","人形娃娃","拼布","滴胶热缩圈","首饰","串珠","手帐","金工","绕线"]
    
     lazy var zeroChildArray : [String] = ["手工课官方"]
    
    
    lazy var animLabel : UILabel = {
    
        let copyCell = UILabel()
        copyCell.backgroundColor = UIColor.white
        copyCell.textAlignment = .center
        return copyCell
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        navigationItem.title = "编辑圈子"
       
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(collectionView)
        view.addSubview(closeBtn)
    }
    

    func popAction() {
        
       dismiss(animated: true, completion: nil)
    }
    
    func addAmationWithCellFrame(frame:CGRect,titleStr : String) {
       
        animLabel.frame = frame
        animLabel.text = titleStr
        collectionView.addSubview(animLabel)
        
        
        let startPoint = frame.origin
        
        let margin = (SCREEN_WIDTH - itemSize.width * 4) / 3
        let endPointX = CGFloat((zeroChildArray.count - 1)  % 4) * (itemSize.width + margin)
        let endPointY = CGFloat((zeroChildArray.count - 1) / 4) * (itemSize.height + 10)
        
        let endPoint = CGPoint(x: endPointX, y: endPointY)
        
        
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addQuadCurve(to: endPoint, controlPoint: startPoint)
        
        
        let keyAnimation = CAKeyframeAnimation(keyPath:"position")
        keyAnimation.path = path.cgPath
        keyAnimation.rotationMode = kCAAnimationRotateAuto
        
        let alphaAnimation = CABasicAnimation(keyPath:"alpha")
        alphaAnimation.duration = 0.5
        alphaAnimation.fromValue = 1.0
        alphaAnimation.toValue = 0.1
        alphaAnimation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseOut)
        
        let group = CAAnimationGroup()
        group.animations = [keyAnimation,alphaAnimation]
        group.duration = 0.8
        group.isRemovedOnCompletion = false
        group.fillMode = kCAFillModeForwards
        group.delegate = self
        group.setValue("groupsAnimation", forKey: "animationName")
        animLabel.layer.add(group, forKey: nil)
    
        
    }
    

}

extension KYHandMoreChildController : LXReorderableCollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView!, itemAt fromIndexPath: IndexPath!, willMoveTo toIndexPath: IndexPath!) {
        
        print(toIndexPath)
        
    }
    

}

extension KYHandMoreChildController : UICollectionViewDataSource{

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return zeroChildArray.count
        }else{
            return moreChildArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let handMoreCell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreChildCellId, for: indexPath) as! KYHandMoreCell
        if indexPath.section == 0 {
    
            handMoreCell.titleStr = zeroChildArray[indexPath.item]
            
        }else{
           
            handMoreCell.titleStr = moreChildArray[indexPath.item]
        }
        return handMoreCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headArray = ["长按拖动排序","点击添加更多圈子 长按拖动排序"]
        
        let handHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MoreChildHeaderView, for: indexPath) as! KYHandMoreHeadView
        handHeaderView.headStr = headArray[indexPath.section]
        return handHeaderView
    }
    
 
    
    
}

extension KYHandMoreChildController : UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: SCREEN_WIDTH, height: 45)
    }
}

extension KYHandMoreChildController : UICollectionViewDelegate{

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 1{
           
            let titleStr = moreChildArray[indexPath.item]
            moreChildArray.remove(at: indexPath.item)
            zeroChildArray.append(titleStr)
            
            let selectedCell = collectionView.cellForItem(at :indexPath)!
            addAmationWithCellFrame(frame: selectedCell.frame,titleStr: titleStr)
        }
    }
    
}

extension KYHandMoreChildController : CAAnimationDelegate{

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
       
        collectionView.reloadData()
        animLabel.removeFromSuperview()
    }
    
}



