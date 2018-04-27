//
//  ViewController.swift
//  HelloWorld
//
//  Created by 김현우 on 2018. 4. 27..
//  Copyright © 2018년 김현우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var playPauseBtn: UIButton!
    @IBOutlet var playTimeLabel: UILabel!
    @IBOutlet var playTimeSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

