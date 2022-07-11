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
    var player: AVAudioPlayer!
    
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBOutlet weak var TitleLabel: UILabel!
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var time = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {

        time.invalidate()
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        ProgressBar.progress = 0.0
        secondsPassed = 0
        TitleLabel.text = hardness
        
        time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            ProgressBar.progress = Float(secondsPassed)/Float(totalTime)
            //print(Float(secondsPassed)/Float(totalTime))
            
        }else{
            time.invalidate()
            player.play()
            TitleLabel.text = "DONE!"
            
        }
        func playSound(soundName: String) {
            let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        }
        
        }
    }
    

