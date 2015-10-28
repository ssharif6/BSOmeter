//
//  ViewController.swift
//  BSOmeter
//
//  Created by Adam Sloma on 10/25/15.
//  Copyright © 2015 Dubhacks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var bsLabel: UILabel!
    @IBOutlet var bsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getRidOfElements() {
        bsLabel.alpha = 0
        bsButton.alpha = 0
        
        bsLabel = nil
        bsButton = nil
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
