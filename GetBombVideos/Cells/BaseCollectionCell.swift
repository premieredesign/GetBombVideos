//
//  BaseCollectionCell.swift
//  GetBombVideos
//
//  Created by Clinton Johnson on 11/8/18.
//  Copyright © 2018 Clinton Johnson. All rights reserved.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        SuperSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SuperSetup() {}
}
