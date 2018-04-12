//
//  ViewController.swift
//  SideMenu
//
//  Created by Gustavo Severo on 09/02/2018.
//  Copyright © 2018 Gustavo Severo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leadingConstrat: NSLayoutConstraint!
    
    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func openMenu(_ sender: Any) {
        
        if (menuShowing) {
            leadingConstrat.constant = -166
        } else {
            leadingConstrat.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
        }
        
        menuShowing = !menuShowing
        
    }
    
}

