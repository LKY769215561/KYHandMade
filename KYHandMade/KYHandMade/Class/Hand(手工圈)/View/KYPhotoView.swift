
//
//  KYPhotoView.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/23.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit


class KYPhotoView: UIView {

    lazy var imageViews : [UIImageView] = {
     
        var images = [UIImageView]()
        for i in 0..<9{
            let imageView = UIImageView()
            imageView.isUserInteractionEnabled = true
            images.append(imageView)
        }
        return images
    }()
    
    
    
    var _picModels : [KYPicModel]?
    var picModels : [KYPicModel]?{
    
        set{
            _picModels = newValue
            let imageCount = (_picModels?.count)!
            for imageView in imageViews{
                imageView.removeFromSuperview()
            }
            if imageCount == 0 {
                height_sd = 0
                fixedHeight = 0
                return
            }
            
            var  itemW : CGFloat = 0
            var  itemH : CGFloat = 0
            
            if imageCount == 1
            {
                let picModel = _picModels?.first
                itemW = SCREEN_WIDTH * 0.7
                itemH = (picModel?.width)!/(picModel?.height)! * itemW
            }else
            {
                itemW = SCREEN_WIDTH > 320 ? 80 : 70
                itemH = itemW
            }
            
            let margin : CGFloat = 5
            
            let column = getColumnCount()
           
            var  imageViewBottm : CGFloat = 100
            for (index,pic) in (_picModels?.enumerated())!
            {
               let columnIndex = index % column
               let rowIndex = index / column
                
               let imageView = imageViews[index]
                imageView.tag = index
               let url =  URL(string:pic.url!)
               
               let tap = UITapGestureRecognizer(target: self, action: #selector(imageViewTap(tap:)))
               imageView.addGestureRecognizer(tap)
               imageView.kf.setImage(with: url, placeholder: UIImage(named:"001"), options: nil, progressBlock: nil, completionHandler: nil)
               let itemX = CGFloat(columnIndex) * (itemW + margin)
               let itemY = CGFloat(rowIndex) * (itemH + margin)
               imageView.frame = CGRect(x: itemX, y: itemY, width: itemW, height: itemH)
               addSubview(imageView)
                
                if pic == _picModels?.last {
                    imageViewBottm = imageView.bottom
                }
            }
           width_sd = CGFloat(column) * itemW + CGFloat((column - 1)) * margin
           height_sd = imageViewBottm + margin
           fixedWidth = width_sd as NSNumber
           fixedHeight = height_sd as NSNumber
            
        }
        
        get{
        
            return _picModels
        }
        
    }
    
    
    func getColumnCount() -> Int {

        return 3
    }
    
    
    @objc func imageViewTap(tap : UITapGestureRecognizer) {
        
    
    }
    
    

}




