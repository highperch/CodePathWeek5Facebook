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
    var transitionImageViewFrame: CGRect!
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        transitionImageView = UIImageView(frame: CGRect(x: 0, y: 75, width: 320, height: 320))
        transitionImageView.image = UIImage(named: "wedding1")
        
        var transitionImageTransform = CGAffineTransformMakeScale(16/15, 16/15)
        

        UIView.animateWithDuration(duration, animations: {
            //self.transitionImageView.frame = self.transitionImageViewFrame
            }) { (finished: Bool) -> Void in
                self.transitionImageView.removeFromSuperview()
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        transitionImageView = UIImageView(frame: CGRect(x: 0, y: 42, width: 320, height: 482))
        transitionImageView.image = UIImage(named: "wedding1")
        
        var transitionImageTransform = CGAffineTransformMakeScale(15/16, 15/16)
        
        UIView.animateWithDuration(duration, animations: {
            
            self.transitionImageView.frame = self.transitionImageViewFrame
            
            }) { (finished: Bool) -> Void in
                self.transitionImageView.removeFromSuperview()
                self.finish()
        }
    }
}