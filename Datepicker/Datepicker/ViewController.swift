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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    
}

