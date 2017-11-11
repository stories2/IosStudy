//
//  ViewController.swift
//  MultiTouch
//
//  Created by 김현우 on 2017. 11. 12..
//  Copyright © 2017년 김현우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtMessage: UILabel!
    @IBOutlet weak var txtTapCount: UILabel!
    @IBOutlet weak var txtTouchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.isMultipleTouchEnabled = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        txtMessage.text = "Touches began"
        txtTapCount.text = String(touch!.tapCount)
        txtTouchCount.text = String(touches.count)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        txtMessage.text = "Touches moved"
        txtTapCount.text = String(touch!.tapCount)
        txtTouchCount.text = String(touches.count)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        txtMessage.text = "Touches ended"
        txtTapCount.text = String(touch!.tapCount)
        txtTouchCount.text = String(touches.count)
    }
}

