//
//  ViewController.swift
//  Botoes arredondados animados
//
//  Created by Gustavo Severo on 07/09/17.
//  Copyright © 2017 Gustavo Severo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var more: UIButton!
    @IBOutlet weak var play: UIButton!
    
    var playButtonCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playButtonCenter = play.center
        
        play.center = more.center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func moreClicked(_ sender: UIButton) {

        UIView.animate(withDuration: 0.3, animations: {
            //animation here
            self.play.center = self.playButtonCenter
        })

        
        //toggleButton(button: sender, onImage: more_on, offImage: more_off)
        
        
    }
    
    @IBAction func playClicked(_ sender: UIButton) {
        //toggleButton(button: sender, onImage: more_on, offImage: more_off)

    }
    
    func toggleButton(button: UIButton, onImage: UIImage, offImage: UIImage){
        if button.currentImage == offImage{
            button.setImage(onImage, for: .normal)
        }else{
            button.setImage(offImage, for: .normal)
        }
    }

}

