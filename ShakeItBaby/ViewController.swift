//
//  ViewController.swift
//  ShakeItBaby
//
//  Created by Bono Kim on 6/2/16.
//  Copyright © 2016 Engene. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    var sounds = ["bean", "belch", "giggle", "pew", "pig", "snore", "static", "uuu"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.MotionShake {
            
            let randomNum = Int(arc4random_uniform(UInt32(sounds.count)))
            
            let audioPath = NSBundle.mainBundle().pathForResource(sounds[randomNum], ofType: "mp3")
            
            do {
                
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!))
                player.play()
                
            } catch {
                
                print("An error has occurred!")
            }
            
            
        }
        
    }

}

