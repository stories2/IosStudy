//
//  ViewController.swift
//  Datepicker
//
//  Created by 김현우 on 2017. 10. 1..
//  Copyright © 2017년 김현우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtNowTime: UILabel!
    @IBOutlet weak var dtSelector: UIDatePicker!
    @IBOutlet weak var txtSelectTime: UILabel!
    
    let timeSelector : Selector = #selector(ViewController.updateTime);
    let intervalTime = 1.0
    var timeCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Timer.scheduledTimer(timeInterval: intervalTime, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OnDateSelect(_ sender: UIDatePicker) {
        let datePickerView = sender
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        txtSelectTime.text = "Select time: " + dateFormatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        print(String(format: "Timer : %5d" , timeCounter))
        
        timeCounter += 1;
    }
}

