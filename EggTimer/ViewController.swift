//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0
    
    var player: AVAudioPlayer!
    
    let soundName = "alarm_sound"
    
    @IBOutlet weak var theStatement: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        
        
        let hardness = sender.currentTitle!
        
        theStatement.text = hardness
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    

        
    
    }
    
    @objc func updateTimer() {
        if secondsPassed <= totalTime {
            
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
            secondsPassed += 1
            
            
    
        }
        
        else  {
            timer.invalidate()
            
            theStatement.text = "Done!"
            playSound()
            
            
        }
    }
    
    func playSound() {
        
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    

}
