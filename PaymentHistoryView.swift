//
//  PaymentHistoryView.swift
//  PeiPei
//
//  Created by My Mac on 8/21/15.
//  Copyright (c) 2015 Swift. All rights reserved.
//

import UIKit

class PaymentHistoryView: UIViewController , UICollectionViewDataSource ,UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate {

    var CollectionAry = ["like.png","location.png","share.png","search.png","plus.png","user.png","like.png","location.png","share.png","search.png","plus.png","user.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

          self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewWillAppear(animated: Bool) {
       
        navigationController!.navigationBar.barStyle = UIBarStyle.Black
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationController!.navigationBar.barTintColor = UIColor(red: 23/255, green: 22/255, blue: 22/255, alpha: 1);
        
        navigationController!.navigationBar.translucent = false;
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.title = "Payment History"
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackAction(sender: AnyObject) {
        
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController, animated: true)
    }
    
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int)-> Int {
       return 10
    }
    
    func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath)-> UITableViewCell {
        var cell2:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("PaymentHistoryCell") as? UITableViewCell
        return cell2!
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 360
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return CollectionAry.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //1
        var cell:SocialProfileCollectonCell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as! SocialProfileCollectonCell
        
        cell.ImageView_out.image = UIImage(named: "image")
        return cell
    }
}
