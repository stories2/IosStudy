//
//  ViewController.swift
//  HellWorld
//
//  Created by 김현우 on 2017. 9. 30..
//  Copyright © 2017년 김현우. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtFieldName: UITextField!
    
    @IBOutlet weak var hellWorldTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtFieldName.delegate = self; // set up delegate this
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPressMe(_ sender: UIButton) {
        txtFieldName.resignFirstResponder();
        hellWorldTitle.text = "God damn, " + txtFieldName.text!
    }
    
    func textFieldShouldReturn(_ txtFieldName: UITextField) -> Bool {
        txtFieldName.resignFirstResponder();
        print("textFieldShouldReturn accepted");
        return true;
    }
}

