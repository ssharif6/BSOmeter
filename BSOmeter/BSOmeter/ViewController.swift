//
//  ViewController.swift
//  BSOmeter
//
//  Created by Adam Sloma on 10/25/15.
//  Copyright © 2015 Dubhacks. All rights reserved.
//

import UIKit
import Parse
class ViewController: UIViewController {
    
    @IBOutlet var bsLabel: UILabel!
    @IBOutlet var bsButton: UIButton!
    
    @IBOutlet var asssss : KASlideShow! //I'm so tired
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this can wait...
        let ssResources = ["jeffmemorial.png", "mlk.png", "ottawaparlay.png", "supremecourt.png", "washingtonmonument.png"]
        self.asssss = KASlideShow()
        self.asssss.delay = 2
        self.asssss.transitionDuration = 0.5
        self.asssss.transitionType = KASlideShowTransitionType.Fade
        self.asssss.imagesContentMode = UIViewContentMode.ScaleAspectFill
        self.asssss.addImagesFromResources(ssResources)
        
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
