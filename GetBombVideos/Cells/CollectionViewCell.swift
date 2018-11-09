//
//  CollectionViewCell.swift
//  GetBombVideos
//
//  Created by Clinton Johnson on 11/8/18.
//  Copyright © 2018 Clinton Johnson. All rights reserved.
//

import UIKit
import AVKit
import WebKit

class CollectionViewCell: BaseCollectionCell, WKNavigationDelegate {
    
    var webView : WKWebView!
    var gameVideo: Videos?
    var main: VideoController?
    
    let dissmissLabel: UILabel = {
       let dl = UILabel()
        
        dl.text = "Dismiss"
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(handleDismiss)))
        
        return dl
    }()
    
    @objc func handleDismiss() {
  
    }
    
    func getData() {
        guard let id = gameVideo?.id else {return}
        
        print(id)
     
        // loading URL :
        let selectedVideo = "https://www.giantbomb.com/videos/embed/\(id)/"
        let url = NSURL(string: selectedVideo)
        let request = NSURLRequest(url: url! as URL)
        
        // init and load request in webview.
        webView = WKWebView(frame: frame)
        webView.navigationDelegate = self
        webView.load(request as URLRequest)
        addSubview(webView)
        sendSubviewToBack(webView)

    }
    
    func setupDismissButton() {
        addSubview(dissmissLabel)
        
        dissmissLabel.plant(top: nil, trailing: trailingAnchor, bottom: bottomAnchor, leading: leadingAnchor, topPadding: 0, rightPadding: 0, bottomPadding: 0, leftPadding: 0, width: 100, height: 100)
    }
    
    override func SuperSetup() {
        backgroundColor = .blue
        
//        setupCollectionCell()
        getData()
        setupDismissButton()
    }
    
}
