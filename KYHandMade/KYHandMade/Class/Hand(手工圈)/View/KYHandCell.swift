//
//  KYHandCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/22.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

class KYHandCell: UITableViewCell {

    /// 头像
    lazy var iconImageView = UIImageView()
    /// 时间
    lazy var timeLabel : UILabel = {
    
      let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.lightGray
        return label
    }()
    /// 名字
    lazy var nameLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.blue
        return label
    }()
    /// 头像
    lazy var contenLabel : UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        label.numberOfLines = 0
        return label
    }()
    
    lazy var photoView  : KYPhotoView = KYPhotoView()
    
    
    var _handModel : KYHandModel?
    var handModel : KYHandModel?{
    
        set{
            
            _handModel = newValue
            let url = URL(string:(_handModel?.avatar)!)
            iconImageView.kf.setImage(with: url)
            nameLabel.text = _handModel?.uname
            timeLabel.text = _handModel?.add_time
            contenLabel.text = _handModel?.subject
            photoView.picModels = _handModel?.picModels
        }
        get{
        return _handModel
        }
    }
 
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        photoView.backgroundColor = UIColor.orange
        
        let childViews : [UIView] = [iconImageView,timeLabel,nameLabel,contenLabel,photoView]
        contentView.sd_addSubviews(childViews)
        
        addLayout()
    }
    
    
    func addLayout() {
        
        let margin : CGFloat = 10.0
        
        
        iconImageView.sd_layout()
        .leftSpaceToView(contentView,margin)?
        .topSpaceToView(contenLabel,margin)?
        .widthIs(40)?
        .heightIs(40)
        iconImageView.sd_cornerRadiusFromWidthRatio = 0.5
        
        nameLabel.sd_layout()
        .topEqualToView(iconImageView)?
        .leftSpaceToView(iconImageView,margin)?
        .heightIs(18)
        nameLabel.setSingleLineAutoResizeWithMaxWidth(200)
        
        timeLabel.sd_layout()
        .leftSpaceToView(iconImageView,margin)?
        .bottomEqualToView(iconImageView)?
        .heightIs(10)
        timeLabel.setSingleLineAutoResizeWithMaxWidth(200)
        
        
        contenLabel.sd_layout()
        .leftEqualToView(iconImageView)?
        .topSpaceToView(iconImageView,10)?
        .rightSpaceToView(contentView,margin)?
        .autoHeightRatio(0)
        
        photoView.sd_layout()
        .leftEqualToView(iconImageView)?
        .topSpaceToView(contenLabel,margin)
        setupAutoHeight(withBottomViewsArray: [contenLabel,photoView], bottomMargin: 10)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
