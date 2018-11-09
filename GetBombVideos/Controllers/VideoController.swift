//
//  VideoController.swift
//  GetBombVideos
//
//  Created by Clinton Johnson on 11/8/18.
//  Copyright © 2018 Clinton Johnson. All rights reserved.
//

import UIKit
import AVKit
import WebKit

class VideoController: UIViewController, WKNavigationDelegate {
    
    var gameVideo: GameModel? {
        didSet {
            guard let id = gameVideo?.results.videos[0].id else {return}
            
            getData(id: id)
        }
    }
    var gameVideos = [Videos]()
    
//    lazy var videoController: VideoController = {
//        let mtv = VideoController()
//        mtv.
//        return mtv
//    }()
    
    var webView : WKWebView!
    
    func getData(id: Int) {
    
        // loading URL :
        let selectedVideo = "https://www.giantbomb.com/videos/embed/\(id)/"
        let url = NSURL(string: selectedVideo)
        let request = NSURLRequest(url: url! as URL)
        
        // init and load request in webview.
        webView = WKWebView(frame: view.layer.frame)
        webView.navigationDelegate = self
        webView.load(request as URLRequest)
        view.addSubview(webView)
        view.sendSubviewToBack(webView)
        
        webView.plant(top: view.topAnchor, trailing: view.trailingAnchor, bottom: nil, leading: view.leadingAnchor, topPadding: 0, rightPadding: 0, bottomPadding: 0, leftPadding: 0, width: 300, height: 400)
        
    }
    
    
    
    func playVideo(video: SearchResults) {
        APIService.shared.getSearchResults(search: video.api_detail_url) { (GameVideo: GameModel) in
            self.gameVideos = GameVideo.results.videos
            self.gameVideo = GameVideo
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    

}
