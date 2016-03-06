//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Justin Peng on 3/3/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoActions: UIImageView!
    
    var linkedImage: UIImage!
    var scrollViewOffset: CGFloat!
    
    @IBAction func didTapDone(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        //imageView.image = linkedImage
        scrollView.contentSize = CGSize(width: 1600, height: 568)
        scrollView.contentOffset.x = scrollViewOffset
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return imageView
    }
    */
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //scrollView.backgroundcolor = UIColor(white: 0, alpha: alpha)
        doneButton.alpha = 0
        photoActions.alpha = 0
        print("scrolling")
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y > 100 {
            self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            scrollView.contentOffset.y = 0
            doneButton.alpha = 1
            photoActions.alpha = 1
        }
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
