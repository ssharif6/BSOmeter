//
//  ResultsPageViewController.swift
//  BSOmeter
//
//  Created by Shaheen Sharifian on 10/17/15.
//  Copyright © 2015 Dubhacks. All rights reserved.
//

import UIKit
import Parse

class ResultsPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func retrieveBsRanking() {
        let query = PFQuery(className: "inputTextParseClass")
        query.getObjectInBackgroundWithId("someUniqueID") { (BSRanking, error) -> Void in
            if error == nil && BSRanking != nil {
                print(BSRanking)
                // Do Something
                var score = BSRanking?.objectForKey("score")
                
            } else {
                print(error)
            }
        }
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
