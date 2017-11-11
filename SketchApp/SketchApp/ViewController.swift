//
//  ViewController.swift
//  SketchApp
//
//  Created by 김현우 on 2017. 11. 12..
//  Copyright © 2017년 김현우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sketchImage: UIImageView!
    var lastTouchPoint: CGPoint!
    var lineWidth: CGFloat = 2.0
    var lineColor = UIColor.gray.cgColor
    var lastImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnOnBackClick(_ sender: UIButton) {
        sketchImage.image = lastImage
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        lastTouchPoint = touch.location(in: sketchImage)
        lastImage = sketchImage.image
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        let currentTouchPoint = touch.location(in: sketchImage)
        
        UIGraphicsBeginImageContext(sketchImage.frame.size)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext?.setStrokeColor(lineColor)
        graphicsContext?.setLineCap(CGLineCap.round)
        graphicsContext?.setLineWidth(lineWidth)
        
        sketchImage.image?.draw(in: CGRect(x: 0, y: 0, width: sketchImage.frame.size.width, height: sketchImage.frame.size.height))
        
        graphicsContext?.move(to: lastTouchPoint)
        graphicsContext?.addLine(to: currentTouchPoint)
        graphicsContext?.strokePath()
        
        sketchImage.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastTouchPoint = currentTouchPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

