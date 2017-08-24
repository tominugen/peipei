
import UIKit

class SocialProfileViewController: UIViewController, UICollectionViewDataSource ,UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate ,UIScrollViewDelegate{
    
    @IBOutlet weak var ImageHeafer: UIImageView!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var table_out: UITableView!
    @IBOutlet weak var headerBackgroundBlack: UIView!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var headerDetailViewContainer: UIView!
    
    
    var CollectionAry = ["like.png","location.png","share.png","search.png","plus.png","user.png","like.png","location.png","share.png","search.png","plus.png","user.png"]
    
    
    var headerStartAnimating:CGFloat!;
    var initialFrame:CGRect!
    var Views:UIView = UIView()
    var defaultViewHeight:CGFloat!
    var emptyTableHeaderView:UIView = UIView()
    var headerImageYOffset:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerImageYOffset = ImageHeafer.frame.origin.y
        headerStartAnimating = 80.0;
        
       // initialFrame = ImageHeafer.frame
       // defaultViewHeight = initialFrame.size.height
        
        
       // emptyTableHeaderView.frame = initialFrame
        self.navigationController?.setNavigationBarHidden(true, animated: false);
        
        headerTitle.frame.origin.y = (HeaderView.frame.size.height)/2;
        headerDetailViewContainer.frame.origin.y = ((HeaderView.frame.size.height)/2) + headerTitle.frame.size.height + 8;
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
        
        headerTitle.font = UIFont(name: "Lato-Light", size: fontSize)
        
    }
    
    @IBAction func Friends_Action(sender: AnyObject) {
        /*
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("nextView") as NextViewController
        self.presentViewController(nextViewController, animated:true, completion:nil)*/
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        var scrollOffset:CGFloat = scrollView.contentOffset.y
        println("scrollOffset=> \(scrollOffset)")
        var headerImageFrame:CGRect = ImageHeafer.frame
        
        if (scrollOffset < 0) {
            headerImageFrame.origin.y = headerImageYOffset - (scrollOffset / 3)
            
        }else{
            headerImageFrame.origin.y = headerImageYOffset - (scrollOffset/2)
        }
        ImageHeafer.frame = headerImageFrame;
        
        //Navigation Bar show Hide,
        println("\(headerImageYOffset) - \(scrollOffset)")
        if((HeaderView.frame.size.height - scrollOffset) <= headerStartAnimating){
          
            var backgroundAlphaOffset = (HeaderView.frame.size.height - scrollOffset)
            println("Animate Navigation \((HeaderView.frame.size.height - scrollOffset))")
            self.headerBackgroundBlack.hidden = false;
            var backgroundAlpha:CGFloat = 1 - (backgroundAlphaOffset/headerStartAnimating);
            println("Bacground alpha \(backgroundAlpha)")
            self.headerBackgroundBlack.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: backgroundAlpha)
            
        }else{
            println("Don't Animate Navigation")
            self.headerBackgroundBlack.hidden = true;
        }
        /*
        // Content/ Title/ Name etc in center
        var headerTitleFrame:CGRect = self.headerTitle.frame;
        headerTitleFrame.origin.y = ((HeaderView.frame.size.height - scrollOffset) - 20) - (headerTitleFrame.size.height/2)
        headerTitle.frame = headerTitleFrame
        */
        if(((HeaderView.frame.size.height - scrollOffset)/2) <= 25){
            headerTitle.frame.origin.y = 25;
            headerDetailViewContainer.frame.origin.y = 25 + headerTitle.frame.size.height + 8;
            //            Userlbl.font =
        }else{
            headerTitle.frame.origin.y = (HeaderView.frame.size.height - scrollOffset)/2;
            headerDetailViewContainer.frame.origin.y = ((HeaderView.frame.size.height - scrollOffset)/2) + headerTitle.frame.size.height + 8;
        }
        if(((HeaderView.frame.size.height - scrollOffset)/2) <= 20){
            headerTitle.frame.origin.y = 20;
            headerDetailViewContainer.frame.origin.y = 25 + headerTitle.frame.size.height + 8;
            //            Userlbl.font =
            headerTitle.font = UIFont(name: "Lato-Regular", size: 16)
        }else{
            headerTitle.frame.origin.y = (HeaderView.frame.size.height - scrollOffset)/2;
            headerDetailViewContainer.frame.origin.y = ((HeaderView.frame.size.height - scrollOffset)/2) + headerTitle.frame.size.height + 8;
            
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
            
            headerTitle.font = UIFont(name: "Lato-Light", size: fontSize)
        }
        
        /*
        if (scrollOffset < 0) {
        // Adjust image proportionally
        headerImageFrame.origin.y = _headerImageYOffset - ((scrollOffset / 3));
        } else {
        // We're scrolling up, return to normal behavior
        headerImageFrame.origin.y = _headerImageYOffset - scrollOffset;
        }
        _headerImage.frame = headerImageFrame;
        */
        //  var headerImageFrame:CGRect =
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    //table delegate....////////
    func numberOfSectionsInTableView(tableView: UITableView)-> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int)-> Int {
        
        println("\(section)")
        
        if section == 0{
           
            return 1
        }
        else if section == 1{
            return 1
        }
        else{
            
            return 10
        }
        
        //return nil
    }
    
    func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath)-> UITableViewCell {
        
        if indexPath.section == 0{
            
            var cell2:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("socialProfileCell") as? UITableViewCell
            
            
            return cell2!
            
        }
        else if indexPath.section == 1{
            
            var cell3:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("socialProfileCell2") as? UITableViewCell
            
            
            return cell3!
        }
        else{
            
            var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("socialProfileCell3") as? UITableViewCell
            
            
            return cell!
        }
        
    }
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
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
        
        
    }
    func buttonTapAction(sender:UIButton!)
    {
        println("Button is working")
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return CollectionAry.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //1
        var cell:SocialProfileCollectonCell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as! SocialProfileCollectonCell
        
        cell.ImageView_out.image = UIImage(named: "katia_millar.png")
        
        return cell
    }
    
    @IBAction func backButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
}