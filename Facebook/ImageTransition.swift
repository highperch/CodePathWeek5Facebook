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
    var transitionImageViewImage: UIImage!
    var transitionImageViewFrame: CGRect!
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        //transitionImageView = UIImageView(frame: CGRect(x: 3, y: 83, width: 156, height: 156))
        transitionImageView = UIImageView(frame: transitionImageViewFrame)
        //transitionImageView.image = UIImage(named: "wedding3")
        transitionImageView.contentMode = UIViewContentMode.ScaleAspectFill
        transitionImageView.image = transitionImageViewImage
        transitionScrollView.addSubview(transitionImageView)
        
        toViewController.view.alpha = 0

        UIView.animateWithDuration(duration, animations: {
            self.transitionImageView.frame = CGRect(x: 0, y: 42, width: 320, height: 482)
            toViewController.view.alpha = 1
            }) { (finished: Bool) -> Void in
                self.transitionImageView.removeFromSuperview()
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        transitionImageView = UIImageView(frame: CGRect(x: 0, y: 42, width: 320, height: 482))
        transitionImageView.image = transitionImageViewImage
        transitionImageView.contentMode = UIViewContentMode.ScaleAspectFill
        transitionScrollView.addSubview(transitionImageView)
        fromViewController.view.alpha = 1
        
        UIView.animateWithDuration(duration, animations: {
            
            fromViewController.view.alpha = 0
            self.transitionImageView.frame = self.transitionImageViewFrame
            
            }) { (finished: Bool) -> Void in
                self.transitionImageView.removeFromSuperview()
                self.finish()
        }
    }
}