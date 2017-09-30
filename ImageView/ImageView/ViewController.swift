//
//  ViewController.swift
//  ImageView
//
//  Created by 김현우 on 2017. 9. 30..
//  Copyright © 2017년 김현우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var switchImage: UISwitch!
    @IBOutlet weak var btnChangeScale: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SwitchImage(_ sender: UISwitch) {
    }
    @IBAction func BtnChangeScale(_ sender: UIButton) {
    }
    
}

