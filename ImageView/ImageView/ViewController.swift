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
    
    var isRotate = false
    var isZoom = false
    var imgCharacterUp: UIImage?
    var imgCharacterDown: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgCharacterUp = UIImage(named: "up.png")
        imgCharacterDown = UIImage(named: "down.png")
        
        imgView.image = imgCharacterDown
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SwitchImage(_ sender: UISwitch) {
        if(isRotate) {
            imgView.image = imgCharacterDown
        }
        else {
            imgView.image = imgCharacterUp
        }
        isRotate = !isRotate
    }
    @IBAction func BtnChangeScale(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if(isZoom) {
            newWidth = imgView.frame.width / scale;
            newHeight = imgView.frame.height / scale;
            imgView.frame.size = CGSize(width: newWidth, height: newHeight);
            
            btnChangeScale.setTitle("Up scale", for: UIControlState.normal);
        }
        else {
            newWidth = imgView.frame.width * scale;
            newHeight = imgView.frame.height * scale;
            imgView.frame.size = CGSize(width: newWidth, height: newHeight);
            
            btnChangeScale.setTitle("Down scale", for: UIControlState.normal);
        }
        
        isZoom = !isZoom
    }
    
}

