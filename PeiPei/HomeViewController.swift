
import UIKit

class HomeViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIScrollViewDelegate ,MenuTransitionManagerDelegate {
    
    let X_BUFFER: Int = 0; //%%% the number of pixels on either side of the segment
    let X_BUFFER_BTN: Int = 0;
    let Y_BUFFER: CGFloat = 7.0; //%%% number of pixels on top of the segment
    let HEIGHT: CGFloat = 30.0; //%%% height of the segment
    
    //%%% customizeable selector bar attributes (the black bar under the buttons)
    let BOUNCE_BUFFER:CGFloat = 10.0; //%%% adds bounce to the selection bar when you scroll
    let ANIMATION_SPEED:CGFloat = 0.2; //%%% the number of seconds it takes to complete the animation
    let SELECTOR_Y_BUFFER:CGFloat = 41.0; //%%% the y-value of the bar that shows what page you are on (0 is the top)
    let SELECTOR_HEIGHT:CGFloat = 3.0; //%%% thickness of the selector bar
    
    let X_OFFSET:CGFloat = 8.0; //%%% for some reason there's a little bit of a glitchy offset.  I'm going to look for a better workaround in the future
    
    var pageViewController : UIPageViewController!
    var activityViewController: ActivityViewController!
    var recentlyVC: RecentlyAddedViewController!
    var popularVC: PopularViewController!
    var viewControllers:NSMutableArray = []
    var viewControllersList:NSMutableArray = []
    var viewControllersListObj:NSMutableArray = []
    var buttonTitleArray:NSMutableArray = []
    
    var currentCount = 0;
    var navigationView:UIView!
    var selectionBar:UIView!
    var selectionBarGreen:UIView!
    var pageScrollView: UIScrollView!
    var currentPageIndex = 0
    
    //HomeView Outlets
    //@IBOutlet weak var headerMenuContainer: SpringView!
    // @IBOutlet weak var headerMenuOnlyContainer: SpringView!
    
    @IBOutlet weak var qrCodeProfileImage: UIImageView!
    
    //Animation
    var selectedRow: Int = 0
    var selectedEasing: Int = 0
    
    var selectedForce: CGFloat = 1
    var selectedDuration: CGFloat = 1
    var selectedDelay: CGFloat = 0
    
    var selectedDamping: CGFloat = 0.7
    var selectedVelocity: CGFloat = 0.7
    var selectedScale: CGFloat = 1
    var selectedX: CGFloat = 0
    var selectedY: CGFloat = 0
    var selectedRotate: CGFloat = 0
    var menuWindow:UIWindow!
    var isMenuShowing:Bool = false;
    var qrcodeImage: CIImage!
    var shouldScroll:Bool = false;
    
    @IBOutlet weak var headerMenuToggleBtn: UIButton!
    
    
    private var menuTransitionManager = MenuTransitionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        shouldScroll = true
        //var navigationController:UINavigationController = UINavigationController()
        
        // var storyboard = UIStoryboard(name: "Main1", bundle: nil)
        activityViewController = storyboard!.instantiateViewControllerWithIdentifier("ActivityViewController") as! ActivityViewController
        recentlyVC = storyboard!.instantiateViewControllerWithIdentifier("recentlyAddedVC") as! RecentlyAddedViewController
        popularVC = storyboard!.instantiateViewControllerWithIdentifier("popularVC") as! PopularViewController
        pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
        buttonTitleArray = ["FRIENDS", "RECENTLY ADDED", "POPULAR PAYMENT"]
        self.pageViewController.dataSource = self
        self.pageViewController.delegate = self
        viewControllers = [activityViewController]
        viewControllersList = ["ActivityViewController", "recentlyAddedVC", "popularVC"]
        viewControllersListObj = [activityViewController, recentlyVC, popularVC]
        
        let pageContentViewController = activityViewController
        self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        // Do any additional setup after loading the view.
        //self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
        self.navigationController!.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 23/255, green: 22/255, blue: 22/255, alpha: 1);
        self.navigationController?.navigationBar.translucent = false;
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.title = "Activity"
        self.navigationController?.navigationBarHidden = false
        
        segmentBtn()
        syncScrollView()
        
        self.pageViewController.view.frame = CGRectMake(0, 40, self.view.frame.width, self.view.frame.height)
        
        if qrcodeImage == nil {
            
            let data = "KATIA MILLER YO".dataUsingEncoding(NSISOLatin1StringEncoding, allowLossyConversion: false)
            
            let filter = CIFilter(name: "CIQRCodeGenerator")
            
            filter.setValue(data, forKey: "inputMessage")
            filter.setValue("M", forKey: "inputCorrectionLevel")
            
            qrcodeImage = filter.outputImage
            
        }
        else {
            //  qrCodeProfileImage.image = nil
            //  qrcodeImage = nil
        }
    }
    
    @IBAction func CaseClick(sender: AnyObject) {
        
        var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        let vc = storyboard.instantiateViewControllerWithIdentifier("SendORRequestPayment") as! SendORRequestPayment
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func cashIconClicked(){
        var vc: AnyObject?
        var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        vc = storyboard.instantiateViewControllerWithIdentifier("SendORRequestPayment") as! SendORRequestPayment
        vc!.loadView()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "HomeAnimation" {
            
            let menuTableViewController = segue.destinationViewController as! AnimationView
            // Assign animator
            self.menuTransitionManager.delegate = self
            menuTableViewController.transitioningDelegate = self.menuTransitionManager
        }
        if segue.identifier == "Case"{
            
            let menuTableViewController = segue.destinationViewController as! AnimationView
            // Assign animator
            self.menuTransitionManager.delegate = self
            menuTableViewController.transitioningDelegate = self.menuTransitionManager
        }
        
    }
    
    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{
        println("before called")
        
        var vcRestorationID = viewController.restorationIdentifier;
        
        var index = self.viewControllersList.indexOfObject(vcRestorationID!);
        
        if(index == 0){
            return nil
        }
        /*if(index == 1){
        return activityViewController
        }*/
        if(index == 1){
            //           currentPageIndex--
            return activityViewController
        }
        
        if(index == 2){
            //            currentPageIndex--
            return recentlyVC
        }
        
        return nil
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
        println("after called")
        var vcRestorationID = viewController.restorationIdentifier;
        
        var index = self.viewControllersList.indexOfObject(vcRestorationID!);
        
        if (index == self.viewControllersList.count - 1) {
            return nil;
        }
        if (index == 0){
            return recentlyVC
        }else if(index == 1){
            return popularVC
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [AnyObject], transitionCompleted completed: Bool){
        self.currentPageIndex = viewControllersListObj.indexOfObject(pageViewController.viewControllers.last!)
        shouldScroll = true
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int{
        println("count for view pager")
        
        return viewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int{
        println("current vc for view pager")
        
        return 0
    }
    
    func syncScrollView(){
        for view in pageViewController.view.subviews as! [UIView] {
            if(view .isKindOfClass(UIScrollView)){
                self.pageScrollView = view as? UIScrollView
                self.pageScrollView.delegate = self
            }
        }
    }
    
    func segmentBtn (){
        println("test")
       
        navigationView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 45))
        navigationView.backgroundColor = UIColor.blackColor()
        let width:CGFloat = (CGFloat(self.view.frame.size.width) - CGFloat(2 * X_BUFFER))/CGFloat(viewControllersList.count)
        println("Width -> \(width), TotalWidth -> \(self.view.frame.size.width)")
        
        selectionBar = UIView(frame: CGRectMake(CGFloat(CGFloat(X_BUFFER) - CGFloat(X_OFFSET)) + 2, SELECTOR_Y_BUFFER, width, SELECTOR_HEIGHT))
        //selectionBar.backgroundColor = UIColor(red: 70/255, green: 194/255, blue: 100/255, alpha: 1)
        selectionBar.backgroundColor = UIColor.clearColor()
        let widthSelectGreen:CGFloat = (CGFloat(self.view.frame.size.width) - 2 * CGFloat(X_BUFFER_BTN))/CGFloat(viewControllersList.count)
        
        selectionBarGreen = UIView(frame: CGRectMake(0, 0.0, widthSelectGreen, SELECTOR_HEIGHT))
        selectionBarGreen.backgroundColor = UIColor(red: 70/255, green: 194/255, blue: 100/255, alpha: 1)
        
        selectionBar.addSubview(selectionBarGreen)
        
        navigationView.addSubview(selectionBar)
        var separatorView: UIView = UIView(frame: CGRectMake(0, 44, self.view.frame.size.width, 1))
        separatorView.backgroundColor = UIColor.whiteColor()
        navigationView.addSubview(separatorView)
        
        for var i=0 as Int; i < viewControllersList.count; i++ {
            let button = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            navigationView.addSubview(button)
            var xPos: CGFloat=0
            //xPos = CGFloat(CGFloat(X_BUFFER) + (CGFloat(i) * CGFloat(self.view.frame.size.width - 2)))
            xPos = CGFloat(X_BUFFER_BTN) + CGFloat(i) * (CGFloat(self.view.frame.size.width) - 2 * CGFloat(X_BUFFER_BTN))/CGFloat(viewControllersList.count) - CGFloat(X_OFFSET)
            var yPos:CGFloat = 0
            yPos = (CGFloat(self.view.frame.size.width) - 2 * CGFloat(X_BUFFER_BTN))/CGFloat(viewControllersList.count)
            
            button.frame = CGRectMake(xPos, Y_BUFFER, yPos, HEIGHT)
          
            
            button.setTitle(buttonTitleArray.objectAtIndex(i) as? String, forState:UIControlState.Normal)
            
            button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            //button.titleLabel?.font = UIFont(
            if DeviceType.IS_IPHONE_4_OR_LESS{
                button.titleLabel!.font = UIFont(name: "Helvetica Neue", size: 11)
            }else if DeviceType.IS_IPHONE_5{
                button.titleLabel!.font = UIFont(name: "Helvetica Neue", size: 11)
            }else if DeviceType.IS_IPHONE_6{
                button.titleLabel!.font = UIFont(name: "Helvetica Neue", size: 12)
            }else if DeviceType.IS_IPHONE_6P{
                button.titleLabel!.font = UIFont(name: "Helvetica Neue", size: 14)
            }
            
            if(i == 0){
                button.addTarget(self, action: "FRIENDS", forControlEvents: UIControlEvents.TouchUpInside)
            }else if(i == 1){
                button.addTarget(self, action: "RECENTLY", forControlEvents: UIControlEvents.TouchUpInside)
            }else if(i == 2){
                button.addTarget(self, action: "POPULAR", forControlEvents: UIControlEvents.TouchUpInside)
            }
        }
        
        self.view.addSubview(navigationView)
    }
    
    func FRIENDS(){
        println("pageIndex=> \(currentPageIndex)")
        if(currentPageIndex != 0){
            shouldScroll = false
            currentPageIndex = 0
            self.customScrollToViewDidScroll()
            viewControllers = [activityViewController]
            self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: UIPageViewControllerNavigationDirection.Reverse, animated: true, completion: { (Bool) -> Void in
                self.shouldScroll = true
            })
        }
    }
    
    func RECENTLY(){
        println("pageIndex=> \(currentPageIndex)")
        if(currentPageIndex == 0){
            currentPageIndex = 1
            self.customScrollToViewDidScroll()
            shouldScroll = false
            viewControllers = [recentlyVC]
            self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion:  { (Bool) -> Void in
                self.shouldScroll = true
            })
        }else if(currentPageIndex == 2){
            currentPageIndex = 1
            shouldScroll = false
            self.customScrollToViewDidScroll()
            viewControllers = [recentlyVC]
            self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: UIPageViewControllerNavigationDirection.Reverse, animated: true, completion:  { (Bool) -> Void in
                self.shouldScroll = true
            })
        }
    }
    
    func POPULAR(){
        println("pageIndex=> \(currentPageIndex)")
        if(currentPageIndex != 2){
            currentPageIndex = 2
            self.customScrollToViewDidScroll()
            shouldScroll = false
            viewControllers = [popularVC]
            self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion:  { (Bool) -> Void in
                self.shouldScroll = true
            })
            
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if(shouldScroll){
            let xFromCenter = self.view.frame.size.width - scrollView.contentOffset.x;
            let xCoor = Int(X_BUFFER) + Int(selectionBar.frame.size.width) * currentPageIndex - Int(X_OFFSET)
            
            let xPos:CGFloat = CGFloat(xCoor) - CGFloat(xFromCenter)/CGFloat(viewControllersList.count)
            println("xPos \(xPos)")
            selectionBar.frame = CGRectMake(xPos, selectionBar.frame.origin.y, selectionBar.frame.size.width, selectionBar.frame.size.height)
            println("scrollview called")
        }
    }
    
    func customScrollToViewDidScroll() {
        /*
        let xFromCenter = self.view.frame.size.width - scrollView.contentOffset.x;
        let xCoor = Int(X_BUFFER) + Int(selectionBar.frame.size.width) * currentPageIndex - Int(X_OFFSET)
        
        let xPos:CGFloat = CGFloat(xCoor) - CGFloat(xFromCenter)/CGFloat(viewControllersList.count)
        println("xPos \(xPos)")
        selectionBar.frame = CGRectMake(xPos, selectionBar.frame.origin.y, selectionBar.frame.size.width, selectionBar.frame.size.height)
        println("scrollview called")
        */
        //let xPos:CGFloat = ((CGFloat)(self.view.frame.size.width/(CGFloat)3)) * ((CGFloat)currentPageIndex);
        let xPos:CGFloat = (CGFloat)(self.view.frame.size.width/3) * (CGFloat)(currentPageIndex)
        UIView.animateWithDuration(0.2, delay: 0, options: .CurveEaseOut, animations: {
                self.selectionBar.frame = CGRectMake(xPos, self.selectionBar.frame.origin.y, self.selectionBar.frame.size.width, self.selectionBar.frame.size.height)
            }, completion: { finished in
                println("Basket doors opened!")
        })
    }
    
    /*
    func displayQRCodeImage() {
    let scaleX = qrCodeProfileImage.frame.size.width / qrcodeImage.extent().size.width
    let scaleY = qrCodeProfileImage.frame.size.height / qrcodeImage.extent().size.height
    
    let transformedImage = qrcodeImage.imageByApplyingTransform(CGAffineTransformMakeScale(scaleX, scaleY))
    
    qrCodeProfileImage.image = UIImage(CIImage: qrcodeImage)
    //CGContextSetShouldAntialias(UIGraphicsGetCurrentContext(), NO);
    //qrCodeProfileImage.image = qrCodeProfileImage.image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "idFirstSegueUnwind" {
    //            let firstViewController = segue.destinationViewController as! ViewController
    
    }
    }
    
    func showFirstViewController() {
    self.performSegueWithIdentifier("idFirstSegueUnwind", sender: self)
    }
    */
    
    
}