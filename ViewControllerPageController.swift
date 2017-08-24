

import UIKit

class ViewControllerPageController: UIViewController , UIPageViewControllerDataSource, UIPageViewControllerDelegate, NavigationNextPageDelegate, NavigationToThirdPageDelegate{
    
    
    var pageViewController : UIPageViewController!
    var CreateAccounts: CreateAccount!
    var AddPhoto: AddPhotoViewController!
    var ThirdVC: ThirdViewController!
    var ForthVC: ForthViewController!
    var viewControllers:NSMutableArray = []
    var viewControllersList:NSMutableArray = []
    var currentCount = 0;
    var currentPageIndex = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        CreateAccounts = storyboard.instantiateViewControllerWithIdentifier("CreateAccount") as! CreateAccount
        AddPhoto = storyboard.instantiateViewControllerWithIdentifier("AddPhotoViewController") as! AddPhotoViewController
        ThirdVC = storyboard.instantiateViewControllerWithIdentifier("ThirdViewController") as! ThirdViewController
        ForthVC = storyboard.instantiateViewControllerWithIdentifier("ForthViewController") as! ForthViewController
        
        pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        self.pageViewController.delegate = self
        
        viewControllers = [CreateAccounts]
        viewControllersList = ["CreateAccount", "AddPhotoViewController","ThirdViewController","ForthViewController"]
        
        print("\(viewControllersList)")
        
        self.pageViewController.setViewControllers(viewControllers as [AnyObject] as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 60, self.view.frame.width, self.view.frame.height-60)
        
        // self.addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        CreateAccounts.delegate = self;
        AddPhoto.delegate = self;
        
    }
    
    func goToPageSecond(){
        viewControllers = [AddPhoto]
        currentPageIndex++
        self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
    }
    func goToPageThird(){
        viewControllers = [ThirdVC]
        currentPageIndex++
        self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBarHidden = true
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{
        
        
        var vcRestorationID = viewController.restorationIdentifier;
        
        var index = self.viewControllersList.indexOfObject(vcRestorationID!)
        println("before==>\(index) & vcRestorationID==>>\(vcRestorationID)")
        currentPageIndex = index;
        if (index == 0)
        {
            return nil;
        }
        if (index == 1)
        {
            return CreateAccounts;
        }
        if (index == 2)
        {
            return AddPhoto;
        }
        if (index == 4)
        {
            return ThirdVC;
        }
        
        return viewControllersList[index] as? UIViewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
        
        
        
        var vcRestorationID = viewController.restorationIdentifier;
        
        var index = self.viewControllersList.indexOfObject(vcRestorationID!);
        println("after==>\(index) & vcRestorationID==>>\(vcRestorationID)")
        currentPageIndex = index;
        if (index == 0)
        {
            return AddPhoto;
        }
        if (index == 1)
        {
            return ThirdVC;
        }
        if (index == 2)
        {
            return ForthVC;
        }
        if (index == 4)
        {
            return nil;
        }
        return viewControllersList[index] as? UIViewController
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int{
        println("count for view pager")
        
        return viewControllersList.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int{
        println("current vc for view pager")
        
        return currentPageIndex;
    }
}
