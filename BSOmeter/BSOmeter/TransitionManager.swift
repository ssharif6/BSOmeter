//
//  TransitionManager.swift
//  BSOmeter
//
//  Created by Adam Sloma on 10/27/15.
//  Copyright © 2015 Dubhacks. All rights reserved.
//

import UIKit

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate  {
    
    private var isPresenting = false
    
    // MARK: UIViewControllerAnimatedTransitioning protocol methods
    
    // animate a change from one viewcontroller to another
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // TODO: Perform the animation
        
        let container = transitionContext.containerView()
        
        let screens : (from: UIViewController, to:UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
        
        
//////////////////////////////////////////*****************////////////////////////////////////////////////////// 
        //TODO: REFACTOR IF STATEMENT CODE SO THAT IT DOESN'T REPEAT SO DAMNED MUCH
//////////////////////////////////////////*****************//////////////////////////////////////////////////////
        
        if screens.from is ViewController {
            let mainNavVC = !self.isPresenting ? screens.from as! MainNavigationController : screens.to as! MainNavigationController
            let bottomVC = !self.isPresenting ? screens.from as UIViewController : screens.to as UIViewController
        
            let mainNavV = mainNavVC.view
            let bottomV = bottomVC.view
        
            if self.isPresenting {
                mainNavV.alpha = 0.0
            }
        
            //add both views to container view controller
            container!.addSubview(bottomV)
            container!.addSubview(mainNavV)
        
            let duration = self.transitionDuration(transitionContext) // a default 0.5 seconds right now
        
            UIView.animateWithDuration(duration, animations: {
                mainNavV.alpha = self.isPresenting ? 1 : 0
            }, completion: { finished in
                transitionContext.completeTransition(true)
                
                UIApplication.sharedApplication().keyWindow?.addSubview(screens.to.view)
            })
        }
        
        if screens.from is MainNavigationController {
            let topVC = !self.isPresenting ? screens.from as UIViewController : screens.to as UIViewController
            let bottomVC = !self.isPresenting ? screens.from as! MainNavigationController : screens.to as UIViewController
            
            let topV = topVC.view
            let bottomV = bottomVC.view
            
            if self.isPresenting {
                topV.alpha = 0
            }
            
            container!.addSubview(bottomV)
            container!.addSubview(topV)
            
            let duration = self.transitionDuration(transitionContext)
            
            UIView.animateWithDuration(duration, animations: {
                topV.alpha = self.isPresenting ? 1 : 0
            }, completion: { finished in
                transitionContext.completeTransition(true)
                
                UIApplication.sharedApplication().keyWindow?.addSubview(screens.to.view)
            })
            
        }
        
        if screens.from is TextInputViewController {
            
            let topVC = !self.isPresenting ? screens.from as UIViewController : screens.to as UIViewController
            let bottomVC = !self.isPresenting ? screens.from as! TextInputViewController : screens.to as UIViewController
            
            let topV = topVC.view
            let bottomV = bottomVC.view
            
            if self.isPresenting {
                topV.alpha = 0
            }
            
            container!.addSubview(bottomV)
            container!.addSubview(topV)
            
            let duration = self.transitionDuration(transitionContext)
            
            UIView.animateWithDuration(duration, animations: {
                topV.alpha = self.isPresenting ? 1 : 0
                }, completion: { finished in
                    transitionContext.completeTransition(true)
                    
                    UIApplication.sharedApplication().keyWindow?.addSubview(screens.to.view)
            })
            
        }
        
        if screens.from is ResultsPageViewController {
            let mainNavVC = !self.isPresenting ? screens.from as! MainNavigationController : screens.to as! MainNavigationController
            let bottomVC = !self.isPresenting ? screens.from as UIViewController : screens.to as UIViewController
            
            let mainNavV = mainNavVC.view
            let bottomV = bottomVC.view
            
            if self.isPresenting {
                mainNavV.alpha = 0.0
            }
            
            //add both views to container view controller
            container!.addSubview(bottomV)
            container!.addSubview(mainNavV)
            
            let duration = self.transitionDuration(transitionContext) // a default 0.5 seconds right now
            
            UIView.animateWithDuration(duration, animations: {
                mainNavV.alpha = self.isPresenting ? 1 : 0
                }, completion: { finished in
                    transitionContext.completeTransition(true)
                    
                    UIApplication.sharedApplication().keyWindow?.addSubview(screens.to.view)
            })
        }
        
    }
    
    // return how many seconds the transiton animation will take
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    // MARK: UIViewControllerTransitioningDelegate protocol methods
    
    // return the animataor when presenting a viewcontroller
    // remmeber that an animator (or animation controller) is any object that aheres to the UIViewControllerAnimatedTransitioning protocol
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.isPresenting = true
        return self
    }
    
    // return the animator used when dismissing from a viewcontroller
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.isPresenting = false
        return self
    }
    
}