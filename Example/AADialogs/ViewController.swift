//
//  ViewController.swift
//  AADialogs
//
//  Created by Ahsan Ali on 10/01/2018.
//  Copyright (c) 2018 Ahsan Ali. All rights reserved.
//

import UIKit
import AADialogs


class ViewController: UIViewController {
    
    let alertVC = getViewController("Main", id: "DemoPopup") as! DemoDialogViewController

    override func viewDidLoad() {
        super.viewDidLoad()        

//        alertVC.setAbsHeight(500)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func triggerPopup(_ sender: UIButton) {
        alertVC.aa_show_alert()
    }
}

/// Get view controller from given AAPopUps object
///
/// - Parameter popup: AAPopUps object
/// - Returns: UIViewController
func getViewController(_ storyboard: String, id: String) -> UIViewController {
    let storyboard: UIStoryboard = UIStoryboard(name: storyboard, bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: id)
}


extension UIViewController {
    static let demoPopup = AADialog("DemoPopup", storyboard: "Main").viewsController
}

