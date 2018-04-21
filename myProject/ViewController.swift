//
//  ViewController.swift
//  myProject
//
//  Created by SWUCOMPUTER on 2018. 4. 21..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var goButton: UIButton!
    @IBOutlet var foodView: UIView!
    @IBOutlet var foodLabel: UILabel!
    var totalString = "아직 아무것도 못 먹었어요!"
    var hidden = true
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        foodView.isHidden=hidden
        foodLabel.text = totalString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
