//
//  BalanceViewController.swift
//  PeiPei
//
//  Created by My Mac on 8/13/15.
//  Copyright (c) 2015 Swift. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
        
        navigationController!.navigationBar.translucent = true;
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.title = "Balance"
        self.navigationController?.navigationBarHidden = false
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 10
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        var cellIdentifier:String = "CustomFields"
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        
        
        
        return cell!
    }

}
