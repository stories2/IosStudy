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
    var lastImage = [UIImage]()
    var sketchImageStackPoint: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnOnBackClick(_ sender: UIButton) {
        if(sketchImageStackPoint > 0) {
            sketchImageStackPoint -= 1;
            sketchImage.image = lastImage[sketchImageStackPoint]
        }
        else {
            sketchImageStackPoint = 0;
            sketchImage.image = nil
        }
    }
    @IBAction func btnOnForwardClick(_ sender: UIButton) {
        if(sketchImageStackPoint < lastImage.count - 1) {
            sketchImageStackPoint += 1
            sketchImage.image = lastImage[sketchImageStackPoint]
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        if(touch.type == UITouchType.stylus) {
            lastTouchPoint = touch.location(in: sketchImage)
            let lastImageStackSize = lastImage.count
            if(sketchImageStackPoint < lastImageStackSize - 1) {
                print("stack point: ", sketchImageStackPoint, " last stack size: ", lastImageStackSize)
                for indexOfSketchNumber in (sketchImageStackPoint + 1)...(lastImageStackSize - 1) {
                    print("remove stack point: ", indexOfSketchNumber)
                    lastImage.remove(at: sketchImageStackPoint + 1)
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        if(touch.type == UITouchType.stylus) {
            let currentTouchPoint = touch.location(in: sketchImage)
            let pencilLineWidth = touch.force * lineWidth
            
            UIGraphicsBeginImageContext(sketchImage.frame.size)
            let graphicsContext = UIGraphicsGetCurrentContext()
            graphicsContext?.setStrokeColor(lineColor)
            graphicsContext?.setLineCap(CGLineCap.round)
            graphicsContext?.setLineWidth(pencilLineWidth)
            
            sketchImage.image?.draw(in: CGRect(x: 0, y: 0, width: sketchImage.frame.size.width, height: sketchImage.frame.size.height))
            
            graphicsContext?.move(to: lastTouchPoint)
            graphicsContext?.addLine(to: currentTouchPoint)
            graphicsContext?.strokePath()
            
            sketchImage.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            lastTouchPoint = currentTouchPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if(sketchImage.image != nil) {
            lastImage.append(sketchImage.image!)
            sketchImageStackPoint += 1;
        }
    }
}

