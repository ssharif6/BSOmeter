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
    @IBOutlet weak var percentageLabel: UILabel!

    @IBOutlet weak var LevelOfTruthLabel: UILabel!
    @IBOutlet weak var percentageWheel: KDCircularProgress!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWheelProperties(0.04)
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
    
    func setWheelProperties(numFromParse: Double) {
        
        percentageWheel.startAngle = -90
        percentageWheel.clockwise = true
        percentageWheel.roundedCorners = true
        percentageWheel.glowMode = .Forward
        percentageWheel.gradientRotateSpeed = 0.5

        percentageWheel.angle = Int((360) * numFromParse)
        
        var percentage: Double = numFromParse * 100
        var fakePercentage = (arc4random_uniform(6))
        print(fakePercentage)
        if percentage < 50 {
            percentageWheel.progressInsideFillColor = UIColor.redColor()
        } else {
            percentageWheel.progressInsideFillColor = UIColor.blueColor()
        }
        
        if percentage < 20 {
            LevelOfTruthLabel.text = "BULLSH*T"
            LevelOfTruthLabel.textColor = UIColor.redColor()
        } else if percentage >= 20 && percentage < 40 {
            LevelOfTruthLabel.text = "MOSTLY BS"
            LevelOfTruthLabel.textColor = UIColor.redColor()
        } else if percentage >= 40 && percentage < 60 {
            LevelOfTruthLabel.text = "MEH"
            LevelOfTruthLabel.textColor = UIColor.blueColor()
        } else if percentage >= 60 && percentage < 80 {
            LevelOfTruthLabel.text = "Mostly True"
            LevelOfTruthLabel.textColor = UIColor.blueColor()
        } else {
            LevelOfTruthLabel.text = "DAMN STRAIGHT"
            LevelOfTruthLabel.textColor = UIColor.blueColor()
        }
        percentageLabel.text = "\(Int(percentage))%"

        
    }

    }
