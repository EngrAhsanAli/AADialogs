//
//  DemoDialogViewController.swift
//  AADialogs_Example
//
//  Created by M. Ahsan Ali on 01/10/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//


import UIKit

class DemoDialogViewController: UIViewController {
    
    @IBOutlet weak var demoLabel: UILabel!
    @IBOutlet weak var demoTextField: UITextField!
    @IBOutlet weak var demoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setBorder(demoTextView)
        setBorder(demoTextField)
        
    }
    
    func setBorder(_ view: UIView) {
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).cgColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func demoButtonAction(_ sender: Any) {
        
        let alert = UIAlertView(title: "Alert", message: "Thanks for submitting your feedback!", delegate: nil, cancelButtonTitle: "OK")
        alert.performSelector(onMainThread: #selector(alert.show), with: nil, waitUntilDone: false)
    }
    
    @IBAction func closeAction(_ sender: Any) {
        
        // MARK:- Dismiss action
        aa_hide_alert(animation: .zoomOut)
//        UIViewController.demoPopup.aa_hide_alert(animation: .zoomOut)
    }
    
}

