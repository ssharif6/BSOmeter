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
    
//    @IBOutlet var activeViewContainer: UIView!
//    private var viewControllerArray: [UIViewController] = []
//    
//    private var activeViewController: UIViewController? {
//        didSet {
//            removeInactiveViewController(oldValue)
//            if isViewLoaded() {
//                addChildViewController(activeViewController!)
//            }
//        }
//    }
//    
//    private func removeInactiveViewController(inactiveViewController: UIViewController?) {
//        if isViewLoaded() {
//            if let inActiveVC = inactiveViewController {
//                inActiveVC.willMoveToParentViewController(nil)
//                inActiveVC.view.removeFromSuperview()
//                inActiveVC.removeFromParentViewController()
//            }
//        }
//    }
//    
//    private func updateActiveViewController() {
//        if isViewLoaded() {
//            if let activeVC = activeViewController {
//                addChildViewController(activeVC)
//                activeVC.view.frame = activeViewContainer.bounds
//                activeViewContainer.addSubview(activeVC.view)
//                activeVC.didMoveToParentViewController(self)
//            }
//        }
//    }
//    
//    var viewControllers: [UIViewController] {
//        get {
//            let immutableCopy = viewControllerArray
//            return immutableCopy
//        }
//        
//        set {
//            viewControllerArray = newValue
//            if activeViewController == nil || !viewControllerArray.contains(activeViewController!) {
//                activeViewController = viewControllerArray.first
//            }
//        }
//    }
//    
//    @IBAction func didTapCheckBSButton(sender: AnyObject) {
//        let f = FormatSelectViewController()
//        displayContentController(f)
//    }
//    
//    
    func displayContentController(content: UIViewController) {
        addChildViewController(content)
        self.view.addSubview(content.view)
        content.didMoveToParentViewController(self)
    }
    
    func hideContentController(content: UIViewController) {
        content.willMoveToParentViewController(nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
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
