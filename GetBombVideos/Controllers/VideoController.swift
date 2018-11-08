//
//  VideoController.swift
//  GetBombVideos
//
//  Created by Clinton Johnson on 11/8/18.
//  Copyright © 2018 Clinton Johnson. All rights reserved.
//

import UIKit

class VideoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
    
    func playVideo(video: Any) {
        print("******", video)
    }
}
