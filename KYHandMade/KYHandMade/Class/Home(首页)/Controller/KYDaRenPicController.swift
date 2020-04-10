//
//  KYDaRenPicController.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/19.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

private let OneIdentifier = "StepOneCell"
private let TwoIdentifier = "StepTwoCell"
private let TheerIdentifier = "StepThreenCell"

class KYDaRenPicController: UICollectionViewController {

    var tagCpunt :String?
    var picModel : KYDaRenPicModel?
    
    
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = SCREEN_SIZE
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        loadData()
    }

    
    func setUI() {
        // Register cell classes
        collectionView?.register(UINib(nibName: "KYDaRenStepOneCell", bundle:nil), forCellWithReuseIdentifier: OneIdentifier)
        collectionView?.register(UINib(nibName: "KYDaRenStepTwoCell", bundle:nil), forCellWithReuseIdentifier: TwoIdentifier)
        collectionView?.register(UINib(nibName: "DaRenStepThreeCell", bundle:nil), forCellWithReuseIdentifier: TheerIdentifier)
        
        
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.isPagingEnabled = true
        collectionView?.bounces = false
        collectionView?.backgroundColor = UIColor.white
        
        let backBtn = UIButton(type:.custom)
        backBtn.frame = CGRect(x: 5, y: 25, width: 20, height: 20)
        backBtn.setImage(UIImage(named:"Image"), for: .normal)
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backBtn)
    }
    
    func loadData() {
        
        
        guard let tagCpunt = tagCpunt else {
            return
        }
        
        let paramet : [String : Any] = [
            
            "c" : "Course" ,
            "a" : "CourseDetial",
            "vid" : "18",
            "id" : tagCpunt
        ]
        
        
        KYNetWorkTool.shared.get(HomeBaseURL, parameters: paramet) { (success, result, error) in
            
            if success{
            
                let data = result?.dictionaryObject?["data"] as? [String : AnyObject]

                guard let picData = data else{
                 return
                }
                 self.picModel = KYDaRenPicModel(dict:picData)
                 self.collectionView?.reloadData()
            }
            
        }
    }
    
    @objc func backAction() {
        dismiss(animated: true, completion: nil)
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let _ = picModel else {
            return 0
        }
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if section == 2
        {
            guard let picModel = picModel else {
                return 0
            }
            return picModel.steps.count
        }else
        {
                return 1
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let    cell = collectionView.dequeueReusableCell(withReuseIdentifier: OneIdentifier, for: indexPath) as! KYDaRenStepOneCell
            cell.picModel = picModel
            return cell
            
        }else if indexPath.section == 1{
        
           let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: TwoIdentifier, for: indexPath) as! KYDaRenStepTwoCell
           cell.picModel = picModel
          return cell
        }else{
        
            
          let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: TheerIdentifier, for: indexPath) as! DaRenStepThreeCell
          cell.currentNum = indexPath.item
          cell.picModel = picModel
          return cell
        }
    }
}
