//
//  ViewController.swift
//  BSOmeter
//
//  Created by Shaheen Sharifian on 10/25/15.
//  Copyright © 2015 Dubhacks. All rights reserved.
//

import UIKit
import Parse
class ViewController: UIViewController {
    
    @IBOutlet var bsLabel: UILabel!
    @IBOutlet var bsButton: UIButton!
    @IBOutlet weak var OttawaParlayImage: UIImageView!
    @IBOutlet weak var WashingtonMonumentImage: UIImageView!
    @IBOutlet weak var MLKIMage: UIImageView!
    @IBOutlet weak var supremeCourtImage: UIImageView!
    @IBOutlet weak var LincolnMemorialImage: UIImageView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        OttawaParlayImage.alpha = 0
        WashingtonMonumentImage.alpha = 0
        MLKIMage.alpha = 0
        supremeCourtImage.alpha = 0
        LincolnMemorialImage.alpha = 1
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "firstPic", userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func firstPic() {
        LincolnMemorialImage.alpha = 1
        OttawaParlayImage.alpha = 0
        UIView.animateWithDuration(1.5) { () -> Void in
            UIViewAnimationCurve.EaseIn
            self.OttawaParlayImage.alpha = 1
            self.LincolnMemorialImage.alpha = 0
        }
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "secondPic", userInfo: nil, repeats: false)
        
    }
    
    func secondPic() {
        OttawaParlayImage.alpha = 1
        WashingtonMonumentImage.alpha = 0
        UIView.animateWithDuration(1.5) { () -> Void in
            UIViewAnimationCurve.EaseIn
            self.WashingtonMonumentImage.alpha = 1
            self.OttawaParlayImage.alpha = 0
        }
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "thirdPic", userInfo: nil, repeats: false)
    }
    
    func thirdPic() {
        WashingtonMonumentImage.alpha = 1
        supremeCourtImage.alpha = 0
        UIView.animateWithDuration(1.5) { () -> Void in
            UIViewAnimationCurve.EaseIn
            self.supremeCourtImage.alpha = 1
            self.WashingtonMonumentImage.alpha = 0
        }
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "lastPic", userInfo: nil, repeats: false)

    }
    
    func lastPic() {
        supremeCourtImage.alpha = 1
        LincolnMemorialImage.alpha = 0
        UIView.animateWithDuration(1.5) { () -> Void in
            UIViewAnimationCurve.EaseIn
            self.LincolnMemorialImage.alpha = 1
            self.supremeCourtImage.alpha = 0
        }
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "firstPic", userInfo: nil, repeats: false)

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
