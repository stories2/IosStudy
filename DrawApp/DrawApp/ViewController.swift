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
        
        UIGraphicsBeginImageContext(drawImageView.frame.size);
        let imageContext = UIGraphicsGetCurrentContext();
        
//        draw line
        imageContext?.setLineWidth(2.0)
        imageContext?.setStrokeColor(UIColor.red.cgColor)
        
        imageContext?.move(to: CGPoint(x: 50, y: 50))
        imageContext?.addLine(to: CGPoint(x: 250, y: 250))
        imageContext?.strokePath()
        
        drawImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDrawRect(_ sender: UIButton) {
        print("btn draw rect pressed");
        
        UIGraphicsBeginImageContext(drawImageView.frame.size)
        let imageContext = UIGraphicsGetCurrentContext()
        
//        draw rect
        imageContext?.setLineWidth(5.0)
        imageContext?.setStrokeColor(UIColor.blue.cgColor)
        imageContext?.addRect(CGRect(x: 50, y: 100, width: 200, height: 200))
        imageContext?.strokePath()
        
        drawImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
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

