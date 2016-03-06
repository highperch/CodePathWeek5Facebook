//
//  LoginViewController.swift
//  Facebook
//
//  Created by Daniel Kim on 2/10/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var logoInitialY: CGFloat!
    var logoOffset: CGFloat!
    var fieldParentOffset: CGFloat!
    var labelParentOffset: CGFloat!
    var fieldParentInitialY: CGFloat!
    var labelParentInitialY: CGFloat!

    
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var labelParentView: UIView!
    @IBOutlet weak var facebookLogo: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func onTouch(sender: UIButton) {
        sender.selected = true
        self.activityIndicator.startAnimating()
        delay(2) {
            if self.emailField.text == "john@gmail.com" && self.passwordField.text == "password" {
                self.activityIndicator.stopAnimating()
                self.performSegueWithIdentifier("signInSegue", sender: self)
            }
            else {
                self.activityIndicator.stopAnimating()
                self.loginButton.selected = false
                let alertController = UIAlertController(title: "Wrong Credentials", message: "Please check your e-mail and password and try again!", preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }

            }
        }
        
    }
    
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func emailEditingChanged(sender: AnyObject) {
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            loginButton.enabled = false
        }
        else {
            loginButton.enabled = true
        }
    }
    
    
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        print("keyboard shows")
        fieldParentView.frame.origin.y = fieldParentInitialY + fieldParentOffset
        print(fieldParentView.frame.origin.y)
        labelParentView.frame.origin.y = labelParentInitialY + labelParentOffset
        facebookLogo.frame.origin.y = logoInitialY + logoOffset
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        print("keyboard hides")
        fieldParentView.frame.origin.y = fieldParentInitialY
        labelParentView.frame.origin.y = labelParentInitialY
        facebookLogo.frame.origin.y = logoInitialY
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
        fieldParentInitialY = fieldParentView.frame.origin.y
        print(fieldParentView.frame.origin.y)
        labelParentInitialY = labelParentView.frame.origin.y
        logoInitialY = facebookLogo.frame.origin.y
        fieldParentOffset = -50
        labelParentOffset = -254
        logoOffset = -30
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
