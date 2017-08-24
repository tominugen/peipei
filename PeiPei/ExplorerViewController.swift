
import UIKit

class ExplorerViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIScrollViewDelegate ,MenuTransitionManagerDelegate, socialProfileCallingDelegate {

    let X_BUFFER: Int = 0; //%%% the number of pixels on either side of the segment
    let X_BUFFER_BTN: Int = 0;
    let Y_BUFFER: CGFloat = 7.0; //%%% number of pixels on top of the segment
    let HEIGHT: CGFloat = 30.0; //%%% height of the segment
    
    //%%% customizeable selector bar attributes (the black bar under the buttons)
    let BOUNCE_BUFFER:CGFloat = 10.0; //%%% adds bounce to the selection bar when you scroll
    let ANIMATION_SPEED:CGFloat = 0.2; //%%% the number of seconds it takes to complete the animation
    let SELECTOR_Y_BUFFER:CGFloat = 40.0; //%%% the y-value of the bar that shows what page you are on (0 is the top)
    let SELECTOR_HEIGHT:CGFloat = 4.0; //%%% thickness of the selector bar
    
    let X_OFFSET:CGFloat = 8.0; //%%% for some reason there's a little bit of a glitchy offset.  I'm going to look for a better workaround in the future

    /////selectionbar...../////
    var Selection_X:CGFloat = 0.0
    var Selection_Width:CGFloat = 50
    
    var pageViewController : UIPageViewController!

    var placesVC: PlacesViewController!
    var peopleVC: PeopleViewController!
    var viewControllers:NSMutableArray = []
    var viewControllersList:NSMutableArray = []
    var viewControllersListObj:NSMutableArray = []
    var buttonTitleArray:NSMutableArray = []
    
    var currentCount = 0;
    var navigationView:UIView!
    var selectionBar:UIView!
    var pageScrollView: UIScrollView!
    var currentPageIndex = 0

    private var menuTransitionManager = MenuTransitionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
      
       // self.navigationController?.navigationBarHidden = false
       // navigationController!.navigationBar.barStyle = UIBarStyle.Black
      //  navigationController!.navigationBar.tintColor = UIColor.whiteColor()
       

        placesVC = storyboard!.instantiateViewControllerWithIdentifier("PlacesViewController") as! PlacesViewController
        peopleVC = storyboard!.instantiateViewControllerWithIdentifier("PeopleViewController") as! PeopleViewController
        
        ////pageviewcontroller////
        pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
        buttonTitleArray = ["PLACES", "PEOPLES"]
        
        self.pageViewController.dataSource = self
        self.pageViewController.delegate = self
        viewControllers = [placesVC]
        viewControllersListObj = [placesVC, peopleVC]
        viewControllersList = ["PlacesViewController","PeopleViewController"]
        
        let pageContentViewController = placesVC
        self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)

        ////navigationcontroller////
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 23/255, green: 22/255, blue: 22/255, alpha: 1);
        self.navigationController?.navigationBar.translucent = false;
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.title = "Explore"
       
        var homeButton : UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "menuIcon"), style: UIBarButtonItemStyle.Plain, target: self, action: "homeMenuClicked")
        
        //menuIcon
        var cashIcon : UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "cashIcon"), style: UIBarButtonItemStyle.Plain, target: self, action: "cashIconClicked")
        
       // self.navigationItem.leftBarButtonItem = homeButton
       // self.navigationItem.rightBarButtonItem = cashIcon
        
        // Do any additional setup after loading the view.
        placesVC.delegate = self;
    }
    
    
    override func viewWillAppear(animated: Bool) {
       
        navigationController!.navigationBar.barStyle = UIBarStyle.Black
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationController!.navigationBar.barTintColor = UIColor(red: 23/255, green: 22/255, blue: 22/255, alpha: 1);
        
        navigationController!.navigationBar.translucent = false;
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.title = "Explorer"
        self.navigationController?.navigationBarHidden = false

        
        self.pageViewController.view.frame = CGRectMake(0, 45, self.view.frame.width, self.view.frame.height)
        segmentBtn()
        syncScrollView()
    }
    
    ///////////animation////
  
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let menuTableViewController = segue.destinationViewController as! AnimationView
        
        
        // Assign animator
        self.menuTransitionManager.delegate = self
        menuTableViewController.transitioningDelegate = self.menuTransitionManager
    }
    
    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
   /*
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        let sourceController = segue.sourceViewController as! AnimationView
        
    }
    */
    ///////////animation////

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{
        println("before called")
        var vcRestorationID = viewController.restorationIdentifier;
        var index = self.viewControllersList.indexOfObject(vcRestorationID!);
        print(index)
        
        if index == 1{
            return peopleVC
        }
       return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
        println("after called")
        var vcRestorationID = viewController.restorationIdentifier;
        //        var index = [self.viewControllersList indexOfObject:viewController.restorationIdentifier];
        var index = self.viewControllersList.indexOfObject(vcRestorationID!);
        print(index)
        
        if index == 0{
            return peopleVC
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [AnyObject], transitionCompleted completed: Bool){
        self.currentPageIndex = viewControllersListObj.indexOfObject(pageViewController.viewControllers.last!)
    }

    func segmentBtn (){
        println("test")
        navigationView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 45))
        navigationView.backgroundColor = UIColor.blackColor()

        println(" TotalWidth -> \(self.view.frame.size.width)")
        
        Selection_X = ((self.view.frame.size.width/2) - 60)/2

        let width:CGFloat = (CGFloat(self.view.frame.size.width) - CGFloat(2 * X_BUFFER))/CGFloat(viewControllersList.count)
        println("Width -> \(width), TotalWidth -> \(self.view.frame.size.width)")

        selectionBar = UIView(frame: CGRectMake(CGFloat(CGFloat(X_BUFFER) - CGFloat(X_OFFSET)) + 2, SELECTOR_Y_BUFFER, width, SELECTOR_HEIGHT))
        var smallView:UIView = UIView(frame: CGRectMake((CGFloat(CGFloat(X_BUFFER) - CGFloat(X_OFFSET)) + 8)+width/3, 0, width/3, SELECTOR_HEIGHT))
        smallView.backgroundColor = UIColor(red: 70/255, green: 194/255, blue: 100/255, alpha: 1.0)
        println(" sel_X -> \(Selection_X)")
        //selectionBar = UIView(frame: CGRectMake(Selection_X, SELECTOR_Y_BUFFER, 60, SELECTOR_HEIGHT))
        
        println("selectionbar==>\(selectionBar.frame)")
        selectionBar.backgroundColor = UIColor(red: 70/255, green: 194/255, blue: 100/255, alpha: 0.0)
        selectionBar.addSubview(smallView)

        navigationView.addSubview(selectionBar)
        var separatorView: UIView = UIView(frame: CGRectMake(0, 44, self.view.frame.size.width, 1))
        separatorView.backgroundColor = UIColor.grayColor()
        
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
                button.titleLabel!.font = UIFont(name: "Helvetica Neue", size: 12)
            }else if DeviceType.IS_IPHONE_5{
                button.titleLabel!.font = UIFont(name: "Helvetica Neue", size: 12)
            }else if DeviceType.IS_IPHONE_6{
                button.titleLabel!.font = UIFont(name: "Helvetica Neue", size: 14)
            }else if DeviceType.IS_IPHONE_6P{
                button.titleLabel!.font = UIFont(name: "Helvetica Neue", size: 16)
            }
        
            
            println("button=>\(button.alignmentRectInsets().left)")
        
        }
        
        self.view.addSubview(navigationView)
    
    }
    func syncScrollView(){
        for view in pageViewController.view.subviews as! [UIView] {
            if(view .isKindOfClass(UIScrollView)){
                self.pageScrollView = view as? UIScrollView
                self.pageScrollView.delegate = self
            }
        }
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let xFromCenter = self.view.frame.size.width - scrollView.contentOffset.x;
        let xCoor = Int(X_BUFFER) + Int(selectionBar.frame.size.width) * currentPageIndex - Int(X_OFFSET)
        
        let xPos:CGFloat = CGFloat(xCoor) - CGFloat(xFromCenter)/CGFloat(viewControllersList.count)
        println("xPos")
        selectionBar.frame = CGRectMake(xPos, selectionBar.frame.origin.y, selectionBar.frame.size.width, selectionBar.frame.size.height)
        println("scrollview called")
        
    }
    func callSocialProfile(int: AnyObject){
        let socialProfVC = self.storyboard!.instantiateViewControllerWithIdentifier("SocialProfileViewController") as! SocialProfileViewController
        
        self.navigationController!.pushViewController(socialProfVC, animated: true)
    }

}
