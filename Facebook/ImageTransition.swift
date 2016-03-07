//
//  ImageTransition.swift
//  Facebook
//
//  Created by Justin Peng on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    var transitionImageView: UIImageView!
    var transitionScrollView: UIScrollView!
    
    var endTransitionImageView: UIImageView!
    var endTransitionScrollView: UIScrollView!
    
    var window = UIApplication.sharedApplication().keyWindow!
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let newsFeedViewController = fromViewController as! NewsFeedViewController
        let photoViewController = toViewController as! PhotoViewController
        
        var frame = window.convertRect(newsFeedViewController.imageViews[newsFeedViewController.selectedIndex].frame, fromView: newsFeedViewController.scrollView)
        
        transitionImageView = UIImageView(frame: frame)
        transitionImageView.contentMode = UIViewContentMode.ScaleAspectFill
        transitionImageView.image = newsFeedViewController.imageViews[newsFeedViewController.selectedIndex].image
        window.addSubview(transitionImageView)
        
        toViewController.view.alpha = 0
        fromViewController.view.alpha = 1

        UIView.animateWithDuration(duration, animations: {
            self.transitionImageView.frame = photoViewController.imageViews[0].frame
            }) { (finished: Bool) -> Void in
                toViewController.view.alpha = 1
                self.transitionImageView.removeFromSuperview()
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let newsFeedViewController = toViewController as! NewsFeedViewController
        let photoViewController = fromViewController as! PhotoViewController
        
        var frame = window.convertRect(photoViewController.imageViews[photoViewController.selectedIndex].frame, fromView: photoViewController.scrollView)
        var endFrame = window.convertRect(newsFeedViewController.imageViews[photoViewController.selectedIndex].frame, fromView: newsFeedViewController.scrollView)
        
        endTransitionImageView = UIImageView(frame: frame)
        endTransitionImageView.image = photoViewController.imageViews[photoViewController.selectedIndex].image
        endTransitionImageView.contentMode = UIViewContentMode.ScaleAspectFill
        window.addSubview(endTransitionImageView)
        
        fromViewController.view.alpha = 0
        toViewController.view.alpha = 1
        
        UIView.animateWithDuration(duration, animations: {
            
            self.endTransitionImageView.frame = endFrame
            
            }) { (finished: Bool) -> Void in
                self.endTransitionImageView.removeFromSuperview()
                self.finish()
        }
    }
}