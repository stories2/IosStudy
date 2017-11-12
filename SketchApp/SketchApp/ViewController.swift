//
//  ViewController.swift
//  SketchApp
//
//  Created by 김현우 on 2017. 11. 12..
//  Copyright © 2017년 김현우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sketchImageView: UIImageView!
    @IBOutlet weak var txtMaxStackPoint: UILabel!
    @IBOutlet weak var txtNowStackPoint: UILabel!
    
    var lastTouchPoint: CGPoint!
    var lineWidth: CGFloat = 2.0
    var lineColor = UIColor.gray.cgColor
    var lastImage = [UIImage]()
    var sketchImageStackPoint: Int = 0
    var lastHandPoint: CGPoint!, lastSketchViewPoint: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveSketchImageView(_ transformX: CGFloat, transformY: CGFloat) {
        sketchImageView.transform.tx = transformX
        sketchImageView.transform.ty = transformY
    }

    @IBAction func btnOnBackClick(_ sender: UIButton) {
        if(sketchImageStackPoint == lastImage.count) {
            sketchImageStackPoint = lastImage.count - 1
        }
        if(sketchImageStackPoint > 0) {
            sketchImageStackPoint -= 1;
            sketchImageView.image = lastImage[sketchImageStackPoint]
        }
        else {
            sketchImageStackPoint = 0;
            sketchImageView.image = nil
            if(lastImage.count == 1) {
                lastImage.remove(at: 0)
            }
        }
        txtMaxStackPoint.text = String(lastImage.count)
        txtNowStackPoint.text = String(sketchImageStackPoint)
    }
    @IBAction func btnOnForwardClick(_ sender: UIButton) {
        if(sketchImageStackPoint < lastImage.count - 1) {
            sketchImageStackPoint += 1
            sketchImageView.image = lastImage[sketchImageStackPoint]
        }
        txtMaxStackPoint.text = String(lastImage.count)
        txtNowStackPoint.text = String(sketchImageStackPoint)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        if(touch.type == UITouchType.stylus) {
            lastTouchPoint = touch.location(in: sketchImageView)
            let lastImageStackSize = lastImage.count
            if(sketchImageStackPoint < lastImageStackSize - 1) {
                print("stack point: ", sketchImageStackPoint, " last stack size: ", lastImageStackSize)
                for indexOfSketchNumber in (sketchImageStackPoint + 1)...(lastImageStackSize - 1) {
                    print("remove stack point: ", indexOfSketchNumber)
                    lastImage.remove(at: sketchImageStackPoint + 1)
                }
            }
        }
        else if(touch.type == UITouchType.direct) {
            lastHandPoint = touch.location(in: sketchImageView)
            let sketchViewX:CGFloat = sketchImageView.transform.tx
            let sketchViewY:CGFloat = sketchImageView.transform.ty
            var sketchViewPoint:CGPoint = CGPoint(x: sketchViewX, y: sketchViewY)
            lastSketchViewPoint = sketchViewPoint
        }
        txtMaxStackPoint.text = String(lastImage.count)
        txtNowStackPoint.text = String(sketchImageStackPoint)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        if(touch.type == UITouchType.stylus) {
            let currentTouchPoint = touch.location(in: sketchImageView)
            let pencilLineWidth = touch.force * lineWidth
            
            UIGraphicsBeginImageContext(sketchImageView.frame.size)
            let graphicsContext = UIGraphicsGetCurrentContext()
            graphicsContext?.setStrokeColor(lineColor)
            graphicsContext?.setLineCap(CGLineCap.round)
            graphicsContext?.setLineWidth(pencilLineWidth)
            
            sketchImageView.image?.draw(in: CGRect(x: 0, y: 0, width: sketchImageView.frame.size.width, height: sketchImageView.frame.size.height))
            
            graphicsContext?.move(to: lastTouchPoint)
            graphicsContext?.addLine(to: currentTouchPoint)
            graphicsContext?.strokePath()
            
            sketchImageView.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            lastTouchPoint = currentTouchPoint
        }
        else if(touch.type == UITouchType.direct) {
            let currentTouchPoint = touch.location(in: sketchImageView)
            let gapWidth = currentTouchPoint.x - lastHandPoint.x
            let gapHeight = currentTouchPoint.y - lastHandPoint.y
            
            moveSketchImageView(lastSketchViewPoint.x + gapWidth, transformY: lastSketchViewPoint.y + gapHeight)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        if(touch.type == UITouchType.stylus) {
            if(sketchImageView.image != nil) {
                lastImage.append(sketchImageView.image!)
                sketchImageStackPoint += 1;
            }
        }
        else if(touch.type == UITouchType.direct) {
            let currentTouchPoint = touch.location(in: sketchImageView)
            let gapWidth = currentTouchPoint.x - lastHandPoint.x
            let gapHeight = currentTouchPoint.y - lastHandPoint.y
            
            moveSketchImageView(lastSketchViewPoint.x + gapWidth, transformY: lastSketchViewPoint.y + gapHeight)
        }
        txtMaxStackPoint.text = String(lastImage.count)
        txtNowStackPoint.text = String(sketchImageStackPoint)
    }
}

