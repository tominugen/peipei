//
//  SettingViewController.swift
//  PeiPei
//
//  Created by My Mac on 8/13/15.
//  Copyright (c) 2015 Swift. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var SclView_out: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackAction(sender: AnyObject) {
       
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController, animated: true)
        
    }
    override func viewWillAppear(animated: Bool) {
        
        SclView_out.contentSize = CGSizeMake(self.view.frame.size.width, 770)
        
        self.navigationController!.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 23/255, green: 22/255, blue: 22/255, alpha: 1);
        //self.navigationController?.navigationBar.translucent = false;
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.title = "Setting "
        self.navigationController?.navigationBarHidden = false
    }
    
    @IBAction func Back_Action(sender: AnyObject) {
        
        //self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController, animated: true)
        
       // var next = self.storyboard?.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
       // self.presentViewController(next, animated: true, completion: nil)
        
    }
    
}
