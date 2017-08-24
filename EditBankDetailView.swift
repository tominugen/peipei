//
//  EditBankDetailView.swift
//  PeiPei
//
//  Created by My Mac on 8/14/15.
//  Copyright (c) 2015 Swift. All rights reserved.
//

import UIKit

class EditBankDetailView: UIViewController {

    @IBOutlet weak var ScrView: UIScrollView!
    @IBOutlet weak var Confirm_Out: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        Confirm_Out.layer.cornerRadius = 20
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    override func viewWillAppear(animated: Bool) {
        
        ScrView.contentSize = CGSizeMake(self.view.frame.size.width, 500)
        
    }

    
}
