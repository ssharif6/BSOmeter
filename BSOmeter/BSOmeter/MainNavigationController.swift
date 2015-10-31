//
//  MainNavigationController.swift
//  BSOmeter
//
//  Created by Shaheen Sharifian on 10/28/15.
//  Copyright © 2015 Dubhacks. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.transitioningDelegate = transitionManager
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