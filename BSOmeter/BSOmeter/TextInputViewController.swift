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

    @IBOutlet weak var inputTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextView.delegate = self
        

        // Do any additional setup after loading the view.
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
