
import UIKit

class AccountSetting: UIViewController {

    @IBOutlet weak var DeletAccount_out: UIButton!
    @IBOutlet weak var ScrView_out: UIScrollView!
    @IBOutlet weak var SaveChnge_out: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DeletAccount_out.layer.cornerRadius=20
        SaveChnge_out.layer.cornerRadius = 20
        
        SaveChnge_out.layer.borderColor = UIColor.grayColor().CGColor
        SaveChnge_out.layer.borderWidth = 1.5

        
    }
    override func viewWillAppear(animated: Bool) {
    
        ScrView_out.contentSize = CGSizeMake(self.view.frame.size.width, 930)
        
        self.navigationController!.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 23/255, green: 22/255, blue: 22/255, alpha: 1);
        self.navigationController?.navigationBar.translucent = false;
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.title = "Account Setting"
        self.navigationController?.navigationBarHidden = false

    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}
