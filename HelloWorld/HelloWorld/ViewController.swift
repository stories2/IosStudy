//
//  ViewController.swift
//  HelloWorld
//
//  Created by 김현우 on 2018. 4. 27..
//  Copyright © 2018년 김현우. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var player: AVAudioPlayer!
    var timer: Timer!
    
    @IBOutlet var playPauseBtn: UIButton!
    @IBOutlet var playTimeLabel: UILabel!
    @IBOutlet var playTimeSlider: UISlider!
    
    func initializePlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "ncs-spectre") else {
            print("cannot load mp3 file")
            return
        }
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError {
            print("initialize failed")
            print("error code: \(error.code), message: \(error.localizedDescription)")
        }
        
        self.playTimeSlider.maximumValue = Float(self.player.duration)
        self.playTimeSlider.minimumValue = 0
        self.playTimeSlider.value = Float(self.player.currentTime)
    }
    
    func updatePlayTimeLabel(time: TimeInterval) {
        let min: Int = Int(time / 60)
        let sec: Int = Int(time.truncatingRemainder(dividingBy: 60))
        let milisec: Int = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        
        let timeText: String = String(format: "%02ld:%02ld:%02ld", min, sec, milisec)
        self.playTimeLabel.text = timeText
    }
    
    func makeAndStartTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [unowned self] (timer: Timer) in
            if self.playTimeSlider.isTracking{
                return
            }
            
            self.updatePlayTimeLabel(time: self.player.currentTime)
            self.playTimeSlider.value = Float(self.player.currentTime)
        })
    }
    
    func invalidateTimer() {
        self.timer.invalidate()
        self.timer = nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initializePlayer()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchUpPlayPauseBtn(_ sender: UIButton) {
        print("touch up play pause btn")
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.player?.play()
        }
        else {
            self.player?.pause()
        }
        
        if sender.isSelected {
            self.makeAndStartTimer()
        }
        else {
            self.invalidateTimer()
        }
    }
    
    @IBAction func sliderValChanged(_ sender: UISlider) {
        print("slider value changed")
        if sender.isTracking {
            return
        }
        self.player.currentTime = TimeInterval(sender.value)
    }
}

