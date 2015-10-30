//
//  TextInputViewController.swift
//  BSOmeter
//
//  Created by Shaheen Sharifian on 10/17/15.
//  Copyright © 2015 Dubhacks. All rights reserved.
//

import UIKit
import Parse

class TextInputViewController: UIViewController, UITextViewDelegate {

    let transitionManager = TransitionManager()
    
    @IBOutlet weak var inputTextView: UITextView!
    
    @IBOutlet var analyzeTextButt: UIButton!
    @IBOutlet var analyzeTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.inputTextView.alpha = 0
        inputTextView.delegate = self
        
        self.transitioningDelegate = self.transitionManager

        self.analyzeTextButt.frame.origin.y-=350
        self.analyzeTextLabel.frame.origin.y-=350
        
        UIView.animateWithDuration(0.5, animations: {
            self.inputTextView.alpha = 1
            
            self.analyzeTextButt.frame.origin.y+=350
            self.analyzeTextLabel.frame.origin.y+=350
        })
        
        // Do any additional setup after loading the view.
        inputTextView!.layer.borderWidth = 1
        inputTextView!.layer.borderColor = UIColor.blackColor().CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    @IBAction func analyzeText(sender: AnyObject) {
        // Access backend.
        let parseInputText = PFObject(className: "inputTextParseClass")
        parseInputText["inputText"] = inputTextView.text
        parseInputText.saveInBackgroundWithBlock { (success, error) -> Void in
            if success {
                // Object is saved
            } else {
                print(error?.description) // Error check
            }
        }

    }

}
