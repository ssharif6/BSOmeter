//
//  FormatSelectViewController.swift
//  BSOmeter
//
//  Created by Adam Sloma on 10/24/15.
//  Copyright © 2015 Dubhacks. All rights reserved.
//

import UIKit

class FormatSelectViewController: UIViewController {
        
    @IBOutlet var inputTextButt: UIButton!
    @IBOutlet var inputPhotoButt: UIButton!
    @IBOutlet var inputTextLab: UILabel!
    @IBOutlet var inputPhotoLab: UILabel!

    let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.transitioningDelegate = transitionManager
        
        self.inputTextButt.frame.origin.x+=300
        self.inputPhotoButt.frame.origin.x-=300
        self.inputTextLab.frame.origin.x+=300
        self.inputPhotoLab.frame.origin.x-=300
        
        UIView.animateWithDuration(0.5, animations: {
            self.inputTextButt.frame.origin.x-=300
            self.inputPhotoButt.frame.origin.x+=300
            self.inputTextLab.frame.origin.x-=300
            self.inputPhotoLab.frame.origin.x+=300
        })
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
