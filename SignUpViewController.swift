

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class SignUpViewController: UIViewController ,FBLoginViewDelegate , FBSDKLoginButtonDelegate {
    
    
    @IBOutlet weak var Email_out: UIButton!
    @IBOutlet weak var Facebook_out: UIButton!
    @IBOutlet weak var fbLoginView: FBLoginView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Email_out.layer.cornerRadius = 22
        Facebook_out.layer.cornerRadius = 22
        
        Email_out.layer.borderColor = UIColor.whiteColor().CGColor
        Email_out.layer.borderWidth = 0.5
        
        
    }
    
    @IBAction func FBSignpAction(sender: AnyObject) {
        
        
        
        var fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.loginBehavior = FBSDKLoginBehavior.Web
        
        // var fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager .logInWithReadPermissions(["email"], handler: { (result, error) -> Void in
            if (error == nil){
                var fbloginresult : FBSDKLoginManagerLoginResult = result
                // if(fbloginresult.grantedPermissions.contains("email"))
                // {
                self.getFBUserData()
                fbLoginManager.logOut()
                //}
            }
        })
        
        
        
    }
    func getFBUserData(){
        if((FBSDKAccessToken.currentAccessToken()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).startWithCompletionHandler({ (connection, result, error) -> Void in
                if (error == nil){
                    println(result)
                }
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        
    }
    
    
    /////.....FBSDKLoginButtonDelegate...../////
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        if error == nil
        {
            println("Login complete.")
            self.performSegueWithIdentifier("showNew", sender: self)
        }
        else
        {
            println(error.localizedDescription)
        }
        
    }
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {
        println("User logged out...")
    }
    /*
    
    ///.....FBloginviewdeleget....////
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
    println("User Logged In")
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
    println("User: \(user)")
    println("User ID: \(user.objectID)")
    println("User Name: \(user.name)")
    //var userEmail = user.objectForKey("email") as! String
    //println("User Email: \(userEmail)")
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
    println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
    println("Error: \(handleError.localizedDescription)")
    }
    
    */
}
