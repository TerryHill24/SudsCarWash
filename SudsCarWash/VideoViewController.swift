//
//  VideoViewController.swift
//  SudsCarWash
//
//  Created by RVC Terry on 11/20/20.
//  Copyright © 2020 RVC Terry. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoViewController: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            // Get the new view controller using segue.destinationViewController.
            
            // Pass the selected object to the new view controller.
            
            
            if segue.identifier == "second"
                
            {
                
                let destination = segue.destination as! PlayerViewController
                
                //Change to match you video filename in supporting files
                
                let termsPath:String? = Bundle.main.path(forResource: "SpeedShine Express Car Wash - Outside & Inside Perspectives_360p", ofType: "mp4")!
                
                let url = NSURL(fileURLWithPath: termsPath!)
                
                destination.player = AVPlayer(url: url as URL)
                
                destination.player!.play()
                
            }
            
            
        }
        
        
}




