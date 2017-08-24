
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var Facebook_out: UIButton!
    
    @IBOutlet weak var Signin_out: UIButton!
    
    @IBOutlet weak var signInEmail: UITextField!
    
    @IBOutlet weak var signInPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Signin_out.layer.cornerRadius=22
        Facebook_out.layer.cornerRadius = 22
        
        Signin_out.layer.borderColor = UIColor.whiteColor().CGColor
        Signin_out.layer.borderWidth = 0.5
        
        //Set the foregroundcolor of the placeholder
        var attributedString = NSAttributedString(string: "E-Mail", attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
        
        signInEmail.attributedPlaceholder = attributedString
       
        var attributedString1 = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
        
        signInPassword.attributedPlaceholder = attributedString1
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dontHaveAnAccount(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true);
        
    }
    
    @IBAction func goToHomeAction(sender: AnyObject) {
        
        var controller = storyboard!.instantiateViewControllerWithIdentifier("HomeViewController") as! UIViewController
        
        
        //controller.navigationController?.title = "Activity"
        let nav = UINavigationController(rootViewController: controller)
        // nav.navigationBar.barStyle = UIBarStyle.Black
        // nav.navigationBar.tintColor = UIColor.whiteColor()
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        self.view.endEditing(true);
        return true;
    }
}

