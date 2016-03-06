//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    
    @IBOutlet var imageView1TapGesture: UITapGestureRecognizer!
    @IBOutlet var imageView2TapGesture: UITapGestureRecognizer!
    @IBOutlet var imageView3TapGesture: UITapGestureRecognizer!
    @IBOutlet var imageView4TapGesture: UITapGestureRecognizer!
    @IBOutlet var imageView5TapGesture: UITapGestureRecognizer!
    
    var imageViews: [UIImageView]!
    var selectedIndex: Int!
    var selectedPhotoFrame: CGRect!
    
    var imageTransition: ImageTransition!
    
    @IBAction func didTapImage(sender: UITapGestureRecognizer) {
        selectedIndex = sender.view!.tag
        print(selectedIndex)
        
        selectedPhotoFrame = sender.view!.frame
        
        self.performSegueWithIdentifier("photoSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        feedImageView.hidden = true
        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
        
        imageViews = [imageView1, imageView2, imageView3, imageView4, imageView5]
    }

    override func viewWillAppear(animated: Bool) {
        delay(2) {
        self.activityIndicator.stopAnimating()
        self.feedImageView.hidden = false
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        /*
        let destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        */
        
        var destinationViewController = segue.destinationViewController as! PhotoViewController
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        imageTransition = ImageTransition()
        destinationViewController.transitioningDelegate = imageTransition
        imageTransition.duration = 1
        
        imageTransition.transitionImageViewFrame = selectedPhotoFrame
        imageTransition.transitionImageViewImage = self.imageViews[selectedIndex].image
        imageTransition.transitionScrollView = scrollView
        destinationViewController.linkedImage = self.imageViews[selectedIndex].image
        destinationViewController.scrollViewOffset = CGFloat(Int(selectedIndex) * 320)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
}
