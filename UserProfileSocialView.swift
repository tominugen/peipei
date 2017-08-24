


import UIKit

class UserProfileSocialView: UIViewController , UICollectionViewDataSource ,UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate ,UIScrollViewDelegate{
    
    
    
    
    @IBOutlet weak var Userlbl: UILabel!
    @IBOutlet weak var AlphaView: UIView!
    @IBOutlet weak var HeaderSubVIew: UIView!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var Table_out: UITableView!
    @IBOutlet weak var ImageHeader: UIImageView!
    @IBOutlet weak var headerDetailViewContainer: UIView!
    
    var headerImageYOffset:CGFloat!
    
    var CollectionAry = ["like.png","location.png","share.png","search.png","plus.png","user.png","like.png","location.png","share.png","search.png","plus.png","user.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HeaderSubVIew.backgroundColor = UIColor(white: 0.05, alpha: 0.7)
        headerImageYOffset = ImageHeader.frame.size.height
        Userlbl.frame.origin.y = (HeaderView.frame.size.height)/2;
        headerDetailViewContainer.frame.origin.y = ((HeaderView.frame.size.height)/2) + Userlbl.frame.size.height + 8;
        var fontSize: CGFloat = ((HeaderView.frame.size.height)/2);
        if(fontSize <= 50){
            fontSize = fontSize - 24;
        }else{
            fontSize = 28;
        }
        if(fontSize <= 16){
            fontSize = 16;
        }
        println("Font Size : \(fontSize)")
        
        Userlbl.font = UIFont(name: "Lato-Light", size: fontSize)

    }
    override func viewWillAppear(animated: Bool) {
        
        navigationController?.navigationBarHidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CommentAction(sender: AnyObject) {
        
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("CommentsViewController") as! CommentsViewController, animated: true)
    }
    @IBAction func PaymentHistoryAction(sender: AnyObject) {
        
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("PaymentHistoryView") as! PaymentHistoryView, animated: true)
        
    }
    
    @IBAction func BackAction(sender: AnyObject) {
        
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController, animated: true)
    }
    
    @IBAction func Friends_Action(sender: AnyObject) {
        
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("ExplorerViewController") as! ExplorerViewController, animated: true)
        
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        var scrollOffset:CGFloat = scrollView.contentOffset.y
        
        var headerImageFrame:CGRect = ImageHeader.frame
        
        if (scrollOffset < 0) {
            
            var scrollOffset:CGFloat = scrollView.contentOffset.y
            headerImageFrame.origin.y = -scrollOffset/2
            AlphaView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent( 1 + (scrollOffset / 230) - 1)
            
        }else{
            AlphaView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(1 + (scrollOffset / 230) - 1)
            headerImageFrame.origin.y = -scrollOffset/2
        }
        
        ImageHeader.frame = headerImageFrame
        
        //////.....lable set....//////////
        if(((HeaderView.frame.size.height - scrollOffset)/2) <= 20){
            Userlbl.frame.origin.y = 20;
            headerDetailViewContainer.frame.origin.y = 25 + Userlbl.frame.size.height + 8;
            //            Userlbl.font =
            Userlbl.font = UIFont(name: "Lato-Regular", size: 16)
        }else{
            Userlbl.frame.origin.y = (HeaderView.frame.size.height - scrollOffset)/2;
            headerDetailViewContainer.frame.origin.y = ((HeaderView.frame.size.height - scrollOffset)/2) + Userlbl.frame.size.height + 8;
            
            var fontSize: CGFloat = ((HeaderView.frame.size.height - scrollOffset)/2);
            if(fontSize <= 50){
                fontSize = fontSize - 24;
            }else{
                fontSize = 28;
            }
            if(fontSize <= 16){
                fontSize = 16;
            }
            println("Font Size : \(fontSize)")
            
            Userlbl.font = UIFont(name: "Lato-Light", size: fontSize)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView)-> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int)-> Int {
        
        println("\(section)")
        
        if section == 0{
            
            println("\(section)")
            return 1
        }
        else if section == 1{
            println("\(section)")
            return 1
        }
        else{
            
            return 10
        }
        
    }
    
    func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath)-> UITableViewCell {
        
        if indexPath.section == 0{
            
            var cell2:UITableViewCell? = Table_out.dequeueReusableCellWithIdentifier("UserProfileCell") as? UITableViewCell
            
            return cell2!
            
        }
        else if indexPath.section == 1{
            
            var cell3:UITableViewCell? = Table_out.dequeueReusableCellWithIdentifier("UserProfileCollection") as? UITableViewCell
            println("hjhhuihuihuihiuhu")
            
            return cell3!
        }
        else{
            var cell:UITableViewCell? = Table_out.dequeueReusableCellWithIdentifier("UserProfileLocalCell") as? UITableViewCell
            println("hjhhuihuihuihiuhu")
            return cell!
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if indexPath.section == 0{
            return 70
        }
        else if indexPath.section == 1{
            return 78
        }
        else{
            return 160.0
        }
        
        //Choose your custom row height
    }
    
    func buttonTapAction(sender:UIButton!)
    {
        println("Button is working")
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return CollectionAry.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell:SocialProfileCollectonCell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as! SocialProfileCollectonCell
        
        cell.ImageView_out.image = UIImage(named: "image")
        
        return cell
    }
}