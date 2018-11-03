//
//  RoundLabel.swift
//  Asrdigital
//
//  Created by Yazdan on 10/21/16.
//  Copyright © 2016 Mandaa. All rights reserved.
//

import UIKit

open class RoundLabelYazdan: SubTitleLabelYazdan {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.round(3, shR: 3, Op: 0.2)
    }
    
}
