
//
//  HYPageView.swift
//  KYPageView
//
//  Created by Kerain on 2017/3/14.
//  Copyright © 2017年 Kerain. All rights reserved.
//

import UIKit


private let  kCollectionCellId :String = "lkycell"

protocol KYPageViewDelegate : class{
    
    // 即将显示的选项视图
    func  pageViewDidShowContentView(currentIndex :Int,title:String) -> UIView
    
}


class KYPageView: UIView {

    
    // MARK:属性
    
    weak  var delegate : KYPageViewDelegate?
    
    var titles:[String]
    var style: KYPageStyle
    
    
      // 内容区
    fileprivate var startOffsetX : CGFloat = 0
    fileprivate lazy var contentCollectionView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        
        let itemW = self.bounds.width
        let itemH = self.bounds.height - self.style.tabHeight
        layout.itemSize = CGSize(width: itemW, height:itemH)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame:CGRect(x:0, y:self.style.tabHeight, width: itemW, height: itemH),collectionViewLayout:layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.bounces = false
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(KYPageCollectionViewCell.self, forCellWithReuseIdentifier:kCollectionCellId)
        return collectionView
    }()
    
     // 标题区
    fileprivate var lastIndex : Int = 0
    fileprivate lazy var titleLabels : [UILabel] = [UILabel]()
    
    fileprivate lazy var tabScrollerView : UIScrollView = {
        let scrollerView = UIScrollView(frame:CGRect(x:0, y:0, width: self.bounds.width, height: self.style.tabHeight))
        scrollerView.showsHorizontalScrollIndicator = false
        return scrollerView
    }()
    
    fileprivate lazy var bottomLine = UIView()

    fileprivate lazy var cellContentViewTags : [Int] = []
    
    
    init(frame:CGRect,titles:[String],style : KYPageStyle) {
        self.titles = titles
        self.style = style
        super.init(frame:frame)
        setUPUI()
    }
    
    fileprivate func setUPUI(){

        addSubview(tabScrollerView)
        addSubview(contentCollectionView)
        tabScrollerView.addSubview(bottomLine)
    
        //  1.创建label
        for(i ,title)in titles.enumerated(){
            
            let titleLabel = UILabel()
            titleLabel.text = title
            titleLabel.tag = i
            titleLabel.textAlignment = .center
            titleLabel.isUserInteractionEnabled = true
            titleLabel.textColor = i == 0 ? style.selectColor : style.normalColor
            titleLabel.font = style.titleFont
            tabScrollerView.addSubview(titleLabel)
            titleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self,action:#selector(titleLabelClick(_:))))
            titleLabels.append(titleLabel)
        }
        
        var labelW : CGFloat = bounds.width/CGFloat(titles.count)
        let labelH : CGFloat = style.tabHeight
        let labelY : CGFloat = 0
        var labelX : CGFloat = 0
        
        
        for (i, titleLabel) in titleLabels.enumerated(){
            
            if style.isScrollEnable
            {
                labelW = (titleLabel.text! as NSString).boundingRect(with: CGSize(width:CGFloat(MAXFLOAT),height:0), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName : style.titleFont], context: nil).width
                
                labelX  += style.titleMargin
                titleLabel.frame = CGRect(x:labelX,y:labelY,width:labelW,height:labelH)
                labelX = titleLabel.frame.maxX
            }else
            {
                labelX = labelW * CGFloat(i)
                titleLabel.frame = CGRect(x:labelX,y:labelY,width:labelW,height:labelH)
            }
            
            if i == lastIndex
            {
                bottomLine.frame = CGRect(x:labelX, y:titleLabel.frame.maxY-style.bottomLineHeight, width:labelW, height:style.bottomLineHeight);
                
                if style.isEqueToTitleLength
                {
                    //bottomLine.width = la
                }
            }
        }
        
        //  设置contentsize
        if style.isScrollEnable
        {
            tabScrollerView.contentSize = CGSize(width:titleLabels.last!.frame.maxX + style.titleMargin,height:0)
        }
        bottomLine.backgroundColor = style.bottomLineBackGroundColor
  
    }
    
    
    func titleLabelClick(_ tap:UITapGestureRecognizer) {
        
        guard let selecteLabel = tap.view as? UILabel else {
            return
        }
        
        guard selecteLabel.tag != lastIndex else {
            
            return
        }
        let indexPath = NSIndexPath(item:selecteLabel.tag,section:0)
        contentCollectionView.scrollToItem(at: indexPath as IndexPath, at: .centeredHorizontally, animated: true)
        adjustMentLabel(currentIndex: selecteLabel.tag)
    }
    
    
    func adjustMentLabel(currentIndex:Int) {
        
        let sourceLabel = titleLabels[lastIndex]
        let selecteLabel = titleLabels[currentIndex]
        sourceLabel.textColor = style.normalColor
        selecteLabel.textColor = style.selectColor
    
        if style.isScrollEnable
        {
            var offsetX = selecteLabel.center.x - tabScrollerView.bounds.width * 0.5
            
            if offsetX < 0 {
                offsetX = 0
            }
            
            let maxOffsetX = tabScrollerView.contentSize.width - tabScrollerView.bounds.width
            
            if offsetX > maxOffsetX {
                offsetX = maxOffsetX
            }
            tabScrollerView.setContentOffset(CGPoint(x:offsetX,y:0), animated: true)
        }

        lastIndex = currentIndex
        UIView.animate(withDuration: 0.25) {
            self.bottomLine.frame = CGRect(x:selecteLabel.frame.origin.x, y:selecteLabel.frame.maxY-self.style.bottomLineHeight, width:selecteLabel.frame.width , height:self.style.bottomLineHeight);
        }
    }

    
    // 如果用子类重写
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    


}

// MARK:collection  UICollectionViewDataSource
extension KYPageView : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollectionCellId, for: indexPath) as! KYPageCollectionViewCell
        let cellContentView = delegate?.pageViewDidShowContentView(currentIndex: indexPath.item, title: titles[indexPath.item])
        
        guard let conent = cellContentView else {
          return pageCell
        }
        conent.backgroundColor = style.contentViewBG
        pageCell.refreshWithContainView(containView: conent)
        return pageCell
    }
}

// MARK:UICollectionViewDelegate
extension KYPageView : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print(indexPath)
    }
    
}

// MARK:UIScrollViewDelegate
extension KYPageView : UIScrollViewDelegate{
    // 开始拖拽
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        startOffsetX = scrollView.contentOffset.x
    }
    
    
    
    // 正在滚动
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffsetX = scrollView.contentOffset.x
        guard contentOffsetX != startOffsetX else {
            return
        }
        
        var sourceIndex = 0
        var targetIndex = 0
        var progress : CGFloat = 0
        
        
        let collectionW = contentCollectionView.bounds.width
        let numPage = Int(contentOffsetX / collectionW)
        if contentOffsetX > startOffsetX  // 左滑
        {
            targetIndex = numPage
            sourceIndex = numPage + 1
            
            if sourceIndex >= titles.count {
                sourceIndex = titles.count-1
            }
        }else  //右滑
        {
            targetIndex = numPage + 1
            sourceIndex = numPage
        }
        
        progress = (contentOffsetX - startOffsetX)/collectionW
       // delegate?.contentView(self, sourceIndex: sourceIndex, targetIndex: targetIndex, progress: progress)
    }
    
    // 停止拖拽
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if !decelerate {
            scrollerViewDidEndScroll()
        }
    }
    // 停止减速
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollerViewDidEndScroll()
        
    }
    
    // 公用方法
    func scrollerViewDidEndScroll() {
        
        let  index  = Int(contentCollectionView.contentOffset.x/contentCollectionView.frame.width)
        adjustMentLabel(currentIndex: index)
    }
    
    
}



