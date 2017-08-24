//
//  FriendsViewController.swift
//  PeiPei
//
//  Created by My Mac on 8/14/15.
//  Copyright (c) 2015 Swift. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{

    
    var SectionAry:NSArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let names = [ "Alpha", "alpha", "bravo"]
        _ = names.sorted { $0.localizedCaseInsensitiveCompare($1) == NSComparisonResult.OrderedAscending }
        
        
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        
    }
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
       
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 10
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
      
        var cellIdentifier:String = "FriendsViewCell"
        var cell:FriendsTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? FriendsTableViewCell
        
        cell?.nmlbl_out.text = SectionAry.objectAtIndex(indexPath.row) as? String
        cell?.img_out.image = UIImage(named: "5.png")
        cell?.lastseenlbl_out.text = "5 minits ago"
        
        return cell!
        
    }
  
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return SectionAry.objectAtIndex(section) as? String
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 25
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 25
    }
    
    @IBAction func back(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}