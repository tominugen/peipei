//
//  WithdrawMoneyController.swift
//  PeiPei
//
//  Created by My Mac on 8/14/15.
//  Copyright (c) 2015 Swift. All rights reserved.
//

import UIKit

class WithdrawMoneyController: UIViewController {

    @IBOutlet weak var Confirm_out: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        Confirm_out.layer.cornerRadius=20
        
        
       

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func viewWillAppear(animated: Bool) {
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBarHidden = false
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
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
