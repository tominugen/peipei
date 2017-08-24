//
//  SignUpWithNumber.swift
//  PeiPei
//
//  Created by My Mac on 8/14/15.
//  Copyright (c) 2015 Swift. All rights reserved.
//

import UIKit

class SignUpWithNumber: UIViewController {

   
    @IBOutlet weak var lblColour_out: UILabel!
    var myMutableString = NSMutableAttributedString()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myMutableString = NSMutableAttributedString(string: "By clicking Done,you agree that you have had an opportunity to review and are consenting without reservation to the following terms and conditions", attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 14.0)!])
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.greenColor(), range: NSRange(location:125,length:21))
        lblColour_out.attributedText = myMutableString
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func viewWillAppear(animated: Bool) {
    
    navigationController?.navigationBarHidden = true
    
    }

   
}
