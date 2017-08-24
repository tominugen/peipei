//
//  ForthViewController.swift
//  PeiPei
//
//  Created by My Mac on 8/13/15.
//  Copyright (c) 2015 Swift. All rights reserved.
//

import UIKit

class ForthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        
    }
    /*
    @IBAction func Action(sender: AnyObject) {
   
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        self.presentViewController(nextViewController, animated:true, completion:nil)
    
    }
    */
    
    @IBAction func DoneAction(sender: AnyObject) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
       // let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
      //  self.presentViewController(nextViewController, animated:true, completion:nil)
        
        //self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController, animated: true)
    }
}
