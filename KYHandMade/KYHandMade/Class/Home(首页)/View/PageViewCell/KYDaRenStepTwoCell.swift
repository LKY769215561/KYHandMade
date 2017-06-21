//
//  KYDaRenStepTwoCell.swift
//  KYHandMade
//
//  Created by Kerain on 2017/6/21.
//  Copyright © 2017年 广州市九章信息科技有限公司. All rights reserved.
//

import UIKit

private let KYStepTableViewCellId = "KYStepTableViewCellId"

class KYDaRenStepTwoCell: UICollectionViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    var picModel : KYDaRenPicModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.rowHeight = 50
        tableView.sectionHeaderHeight = 40
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        tableView.register(UINib(nibName:"KYStepTableViewCell", bundle : nil), forCellReuseIdentifier: KYStepTableViewCellId)
        tableView.tableFooterView = UIView()
        
    }

}

extension KYDaRenStepTwoCell : UITableViewDataSource{

    
    func numberOfSections(in tableView: UITableView) -> Int {

        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let picModel = picModel else {
            return 0
        }
        if section == 0 {
          return picModel.materials.count
        }else{
          return picModel.tools.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let stepCell = tableView.dequeueReusableCell(withIdentifier: KYStepTableViewCellId) as! KYStepTableViewCell
        
        if indexPath.section == 0 {
            stepCell.materModel = picModel?.materials[indexPath.row]
        }else{
            stepCell.toolModel = picModel?.tools[indexPath.row]
        }
        return stepCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     
        if section == 0 {
            return addHeadView(headStr: "所需材料")
        }else{
            return addHeadView(headStr: "所需工具")
        }
    }
    
    
    func addHeadView(headStr : String) -> UILabel {

        let headerLabel = UILabel(frame:CGRect(x:0, y:0, width:SCREEN_WIDTH,height:40))
        headerLabel.backgroundColor = KYRGB(206, g: 206, b: 206, alpha: 1)
        headerLabel.text = headStr;
        headerLabel.textAlignment = .center
        return headerLabel;
    }
    
  
}
extension KYDaRenStepTwoCell : UITableViewDelegate{


}
