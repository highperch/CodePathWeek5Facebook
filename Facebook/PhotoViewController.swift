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
    
    @IBOutlet weak var wedding1: UIImageView!
    @IBOutlet weak var wedding2: UIImageView!
    @IBOutlet weak var wedding3: UIImageView!
    @IBOutlet weak var wedding4: UIImageView!
    @IBOutlet weak var wedding5: UIImageView!
    
    var linkedImage: UIImage!
    var scrollViewOffset: CGFloat!
    var imageViews: [UIImageView]!
    var selectedIndex: Int!
    var scrollDistance: CGFloat!
    
    @IBAction func didTapDone(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //imageView.image = linkedImage
        scrollView.contentSize = CGSize(width: 1600, height: 668)
        scrollView.contentOffset.x = scrollViewOffset
        scrollView.delegate = self
        // Do any additional setup after loading the view.
        imageViews = [wedding1, wedding2, wedding3, wedding4, wedding5]
        scrollView.bouncesZoom = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return imageViews[selectedIndex]
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        scrollDistance = scrollView.contentOffset.y
        let alpha = 1 - (abs(scrollView.contentOffset.y) / 100)
        scrollView.backgroundColor = UIColor(white: 0, alpha: alpha)
        
        if scrollDistance > 0 && scrollDistance < 30 {
        doneButton.alpha = (30 - scrollDistance)/30
        photoActions.alpha = (30 - scrollDistance)/30
        } else if scrollDistance >= 30 {
            
            doneButton.alpha = 0
            photoActions.alpha = 0
        } else if scrollDistance < 0 && scrollDistance > -30 {
            doneButton.alpha = (30 + scrollDistance)/30
            photoActions.alpha = (30 + scrollDistance)/30
        } else if scrollDistance <= -30 {
            doneButton.alpha = 0
            photoActions.alpha = 0
        }
        print(scrollView.contentOffset.y)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        selectedIndex = Int(scrollView.contentOffset.x/320)
        scrollViewOffset = scrollView.contentOffset.x
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if scrollView.contentOffset.y > 100 || scrollView.contentOffset.y < -100 {
            
            scrollView.contentOffset.y = scrollDistance
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
