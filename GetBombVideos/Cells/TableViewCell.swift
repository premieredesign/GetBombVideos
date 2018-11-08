//
//  TableViewCell.swift
//  GetBombVideos
//
//  Created by Clinton Johnson on 11/8/18.
//  Copyright © 2018 Clinton Johnson. All rights reserved.
//

import UIKit

class TableViewCell: BaseCell {
    
    var searchResults: SearchResults? {
        didSet {
            guard let imageString = searchResults?.image.medium_url else {return}
            guard let name = searchResults?.name else {return}
            
            customImageView.downloadedFrom(link: imageString, contentMode: .scaleAspectFill)
            
            nameLabel.text = name
        }
    }
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    let customImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .clear
        iv.clipsToBounds = true
        
        return iv
    }()
    
    let overlayShadow: UIView = {
        let os = UIView()
        os.translatesAutoresizingMaskIntoConstraints = false
        os.backgroundColor = .clear
        
        return os
    }()
    
    func setup() {
        addSubview(customImageView)
        
        customImageView.addSubview(overlayShadow)
        customImageView.addSubview(nameLabel)
        
        nameLabel.plant(top: customImageView.topAnchor, trailing: nil, bottom: nil, leading: customImageView.leadingAnchor, topPadding: 150, rightPadding: 0, bottomPadding: 0, leftPadding: 50, width: 0, height: 30)
        
        overlayShadow.plant(top: customImageView.topAnchor, trailing: customImageView.trailingAnchor, bottom: nil, leading: customImageView.leadingAnchor, topPadding: 150, rightPadding: 0, bottomPadding: 0, leftPadding: 0, width: 0, height: 50)
        
        customImageView.plant(top: topAnchor, trailing: trailingAnchor, bottom: bottomAnchor, leading: leadingAnchor, topPadding: 0, rightPadding: 0, bottomPadding: 0, leftPadding: 0, width: 0, height: 0)
        addingBlurEffect(above: overlayShadow, at: 0)
    }
    
    
    func addingBlurEffect(above uView: UIView, at: Int) {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = CGRect(x: 0, y: uView.frame.origin.y, width: uView.frame.width, height: uView.frame.height)
        blurEffectView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        
        uView.insertSubview(blurEffectView, aboveSubview: uView)
    }
    
    override func SuperSetup() {
        setup()
    }
    
}
