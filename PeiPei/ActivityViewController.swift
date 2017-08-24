//
//  ActivityViewController.swift
//  PeiPei
//
//  Created by My Mac on 8/12/15.
//  Copyright (c) 2015 Swift. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
       // navigationController!.navigationBar.barStyle = UIBarStyle.Black
       // navigationController!.navigationBar.tintColor = UIColor.whiteColor()

        
        // Do any additional setup after loading the view.
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 13;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell: ActivityCustomCell = (tableView.dequeueReusableCellWithIdentifier("activityCell") as? ActivityCustomCell)!
        cell.activityTitle.text = "Custom Class Test"
       // var title: UILabel = cell?.viewWithTag(602) as! UILabel;
       // title.text = "test"
        cell.activityLikeBtn.tag = indexPath.row;
        cell.activityLikeBtn.addTarget(self, action: "activityLikeClick:", forControlEvents: UIControlEvents.TouchUpInside)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }

    func activityLikeClick(sender: UIButton){
        var btn:UIButton = sender as UIButton
        println("=> \(btn.tag)")
    }
    
    func activityCommentClick(sender: UIButton){
        var btn:UIButton = sender as UIButton
        println("=> \(btn.tag)")
    }
}