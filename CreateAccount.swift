//
//  CreateAccount.swift
//  PeiPei
//
//  Created by My Mac on 8/12/15.
//  Copyright (c) 2015 Swift. All rights reserved.
//

import UIKit
protocol NavigationNextPageDelegate
{
    func goToPageSecond()
}

class CreateAccount: UIViewController {

    var delegate:NavigationNextPageDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
       
        self.navigationController?.navigationBarHidden = true
        
    }
    @IBOutlet weak var callNextPage: UIButton!

    @IBAction func callNextPageAction(sender: AnyObject) {
        delegate?.goToPageSecond()
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
