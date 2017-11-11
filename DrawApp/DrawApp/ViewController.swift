//
//  ViewController.swift
//  DrawApp
//
//  Created by 김현우 on 2017. 11. 11..
//  Copyright © 2017년 김현우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnDrawLine(_ sender: UIButton) {
        print("btn draw line pressed");
    }
    
    @IBAction func btnDrawRect(_ sender: UIButton) {
        print("btn draw rect pressed");
    }
    
    @IBAction func btnDrawCircle(_ sender: UIButton) {
        print("btn draw circle pressed");
    }
    
    @IBAction func btnDrawHalfCircle(_ sender: UIButton) {
        print("btn draw half circle pressed");
    }
    @IBAction func btnDrawFill(_ sender: UIButton) {
        print("btn draw fill pressed");
    }
}

