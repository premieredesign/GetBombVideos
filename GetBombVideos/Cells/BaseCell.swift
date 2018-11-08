//
//  BaseCell.swift
//  GetBombVideos
//
//  Created by Clinton Johnson on 11/8/18.
//  Copyright © 2018 Clinton Johnson. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        SuperSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SuperSetup() {}
}
