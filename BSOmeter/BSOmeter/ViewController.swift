//
//  ViewController.swift
//  BSOmeter
//
//  Created by Shaheen Sharifian on 10/17/15.
//  Copyright © 2015 Dubhacks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet var checkBSButton: UIButton!
    @IBOutlet var BSOMeterLabel: UILabel!
    
    @IBAction func switchToInputSelect(sender: AnyObject) {
//        //fade out buttons and set them to nil
//        UIView.animateWithDuration(0.6, animations: {
//            self.checkBSButton.frame.origin.y+=200
//            self.checkBSButton.alpha = 0.0
//            
//            self.BSOMeterLabel.frame.origin.y-=200
//            self.BSOMeterLabel.alpha = 0.0
//        })
//        
//        self.checkBSButton = nil;
//        self.BSOMeterLabel = nil;
        
        let format = FormatSelectViewController()
            }
    
    
}

