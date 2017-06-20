//
//  KYNavTitleView.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/20.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYNavTitleView: UIView {

   
    var clickBlock : ((_ btn : UIButton)->())?
    let titleArr = ["图文","视频","专题"]
    
    
    init(frame: CGRect,clickBlock:@escaping (_ btn : UIButton)->()) {
        super.init(frame: frame)
        self.clickBlock = clickBlock
       
        
        
        let margin : CGFloat = 5.0
        let btnW = (width - 2 * margin)/3
        for (index,title) in titleArr.enumerated() {
            
            let NavBtn = UIButton()
            NavBtn.setTitle(title, for: .normal)
            NavBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            NavBtn.setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
            NavBtn.setTitleColor(UIColor.white, for: .selected)
            let btnX = CGFloat(index) * (margin + btnW)
            NavBtn.frame = CGRect(x:btnX, y:0, width: btnW, height: height)
            NavBtn.addTarget(self, action: #selector(buttonClick(btn:)), for: .touchUpInside)
            NavBtn.tag = index
            addSubview(NavBtn)
            if index == 0 || index == 1
            {
                let marginLine = UIView(frame:CGRect(x:NavBtn.right + margin/2, y:10, width: 1, height: height-20))
                marginLine.backgroundColor = UIColor(white: 0.6, alpha: 0.6)
                addSubview(marginLine)
            }
            
        }
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func buttonClick(btn : UIButton) {
      
        guard let block = self.clickBlock else {
            return
        }
        
        block(btn)
    }
    
    
}
