//
//  ViewController.swift
//  SlideMenu
//
//  Created by Gustavo Severo on 02/03/2018.
//  Copyright © 2018 Gustavo Severo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuButtom: UIBarButtonItem!
    @IBOutlet weak var alertButtom: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenus()
        customizeNavBar()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sideMenus() {
        
        if revealViewController() != nil {
            menuButtom.target = revealViewController()
            menuButtom.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            
            alertButtom.target = revealViewController()
            alertButtom.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        
    }
    
    func customizeNavBar() {
        
        navigationController?.navigationBar.tintColor = UIColor(displayP3Red: 255, green: 255, blue: 255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 255, green: 87, blue: 35, alpha: 1)
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
    }

}
