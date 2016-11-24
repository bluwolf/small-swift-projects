//
//  ViewController.swift
//  HelloooWorld
//
//  Created by Xiaohan Chen on 11/21/16.
//  Copyright © 2016 Xiaohan Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var welcomeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        titleImage.isHidden = false
        backgroundImage.isHidden = false
        welcomeButton.isHidden = true
    }


}

