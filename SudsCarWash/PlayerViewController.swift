//
//  PlayerViewController.swift
//  SudsCarWash
//
//  Created by RVC Terry on 11/20/20.
//  Copyright © 2020 RVC Terry. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class PlayerViewController: AVPlayerViewController {
    //   override func viewDidLoad() {
    //       super.viewDidLoad()
    //
    //       // Do any additional setup after loading the view.
    //   }
    //
    //   override func didReceiveMemoryWarning() {
    //       super.didReceiveMemoryWarning()
    //       // Dispose of any resources that can be recreated.
    //   }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }
}

