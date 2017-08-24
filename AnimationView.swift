

import UIKit

class AnimationView: UIViewController {

    
    @IBOutlet weak var barCodeImage: UIImageView!
    var qrcodeImage: CIImage!
    
    var navigation:UINavigationController!
    override func viewDidLoad() {
        super.viewDidLoad()

        var navigation:UINavigationController
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
        self.displayQRCodeImage()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
       // self.navigationController?.navigationBarHidden = false
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        println("prepareforseuge called....")
    }
  
    
    @IBAction func PaymentHistory_Action(sender: AnyObject) {
       
       // var next = self.storyboard?.instantiateViewControllerWithIdentifier("FriendsViewController") as! FriendsViewController
       // self.presentViewController(next, animated: true, completion: nil)
        
        
    }
    func displayQRCodeImage() {
        let scaleX = barCodeImage.frame.size.width / qrcodeImage.extent().size.width
        let scaleY = barCodeImage.frame.size.height / qrcodeImage.extent().size.height
        
        let transformedImage = qrcodeImage.imageByApplyingTransform(CGAffineTransformMakeScale(scaleX, scaleY))
        
        barCodeImage.image = UIImage(CIImage: qrcodeImage)
        //CGContextSetShouldAntialias(UIGraphicsGetCurrentContext(), NO);
        //qrCodeProfileImage.image = qrCodeProfileImage.image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
    }
}
