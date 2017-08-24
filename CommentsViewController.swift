//
//  CommentsViewController.swift
//  PeiPei
//
//  Created by My Mac on 8/13/15.
//  Copyright (c) 2015 Swift. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{

    @IBOutlet weak var Table_out: UITableView!
    @IBOutlet weak var FooterView_out: UIView!
    @IBOutlet weak var TxtFild_out: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        
        navigationController!.navigationBar.barStyle = UIBarStyle.Black
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationController!.navigationBar.barTintColor = UIColor(red: 23/255, green: 22/255, blue: 22/255, alpha: 1);
        
        navigationController!.navigationBar.translucent = false;
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.title = "Comments"
        self.navigationController?.navigationBarHidden = false

        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }
    func textFieldShouldReturn(userText: UITextField) -> Bool {
        
        TxtFild_out.resignFirstResponder()
        return true
    }
    func keyboardWillShow(notification: NSNotification) {
        
        let frame:CGRect = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        //println("keyboardFrame: \(frame)")
        
        FooterView_out.frame.origin.y = FooterView_out.frame.origin.y - frame.size.height 
        
        println("FooterView_out: \(FooterView_out.frame.origin.y)")
        Table_out.frame.origin.y = -frame.size.height //+ 100
        
        println(Table_out.frame.origin.y)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        let frame:CGRect = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
         FooterView_out.frame.origin.y = FooterView_out.frame.origin.y + frame.size.height
       
         //println("FooterView_out: \(FooterView_out.frame.origin.y)")
        
        Table_out.frame.origin.y = 0
        
        println(Table_out.frame.origin.y)
        
       // println("keyboard hide")
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 10
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        var cellIdentifier:String = "CommentVIewCell"
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        
        return cell!
    }
}
