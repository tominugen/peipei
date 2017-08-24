

import UIKit

protocol socialProfileCallingDelegate {
    func callSocialProfile(int: AnyObject)
}

class PlacesViewController: UIViewController ,UITableViewDataSource ,UITableViewDelegate ,UICollectionViewDelegate, UICollectionViewDataSource {

    
    var data = [1,2,3,4,5,6,7,8,9,10]
    var delegate: socialProfileCallingDelegate?
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cellIdentifier:String = "PlaceViewCell"
        
        var cell:PlaceTableViewCell = (tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? PlaceTableViewCell)!
        
        cell.CollectionView_out.reloadData()
        cell.CollectionView_out.delegate = self
        cell.CollectionView_out.dataSource = self
    
        
        return cell
        
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150;
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return 10
        
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        var  cell:UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("PlaceCollectionCell", forIndexPath: indexPath) as! UICollectionViewCell
        
        
        
        return cell
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        /*let socialProfVC = self.storyboard?.instantiateViewControllerWithIdentifier("SocialProfileViewController") as? SocialProfileViewController
        self.navigationController?.pushViewController(socialProfVC!, animated: true)*/
        /*let socialProfVC = self.storyboard!.instantiateViewControllerWithIdentifier("SocialProfileViewController") as! SocialProfileViewController
        
        self.navigationController!.pushViewController(socialProfVC, animated: true)*/
        delegate?.callSocialProfile(indexPath.row);
    }   
}







