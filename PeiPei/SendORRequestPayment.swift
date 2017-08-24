//
//  SendORRequestPayment.swift
//  PeiPei
//
//  Created by My Mac on 8/21/15.
//  Copyright (c) 2015 Swift. All rights reserved.
//

import UIKit

class SendORRequestPayment: UIViewController ,UITextFieldDelegate ,MenuTransitionManagerDelegate{

    
    @IBOutlet weak var RequestSendlbl: UILabel!
    @IBOutlet weak var Request_out: UIButton!
    @IBOutlet weak var FooterView: UIView!
    @IBOutlet weak var Discription_txtfld: UITextField!
   
    
    var request:Bool = true
     private var menuTransitionManager = MenuTransitionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
    
       // self.navigationController?.navigationBarHidden = false
       // self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
        navigationController!.navigationBar.barStyle = UIBarStyle.Black
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationController!.navigationBar.barTintColor = UIColor(red: 23/255, green: 22/255, blue: 22/255, alpha: 1);
        
        navigationController!.navigationBar.translucent = false;
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.title = "Send or Request Payment"
        self.navigationController?.navigationBarHidden = false

        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    
        
        //ToolbarShowOnKeyboard()
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "SendOrRequestAnimation"{
            
            let menuTableViewController = segue.destinationViewController as! AnimationView
            // Assign animator
            self.menuTransitionManager.delegate = self
            menuTableViewController.transitioningDelegate = self.menuTransitionManager
        }
        
    }
    
    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func NavigationRight_action(sender: AnyObject) {
       
        
        if request {
            
            Request_out.titleLabel?.text = "    SEND"
            RequestSendlbl.text = "SEND TO:"
            
            request = false
        }
        else{
            
            RequestSendlbl.text = "REQUEST FROM:"
            Request_out.titleLabel?.text = "REQUEST"

            request = true
        }
        
        
    }
    func textFieldShouldReturn(userText: UITextField) -> Bool {
        
        self.Discription_txtfld.resignFirstResponder()
        return false
    }
    func keyboardWillShow(notification: NSNotification) {
       
        let frame:CGRect = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        println("keyboardFrame: \(frame)")
        
       FooterView.frame.origin.y = FooterView.frame.origin.y - frame.size.height
      
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        let frame:CGRect = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        FooterView.frame.origin.y = FooterView.frame.origin.y + frame.size.height
        
        println("keyboard hide")
    }
    
   

    

}
