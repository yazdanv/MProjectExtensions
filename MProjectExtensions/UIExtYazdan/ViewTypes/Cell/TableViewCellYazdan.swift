//
//  TableViewCellYazdan.swift
//  Pods
//
//  Created by Yazdan on 12/15/16.
//
//

import UIKit

open class TableViewCellYazdan: UITableViewCell, ReusableView, NibLoadableView {
    
    open override func awakeFromNib() {
        self.selectionStyle = UITableViewCell.SelectionStyle.none;
    }

}
