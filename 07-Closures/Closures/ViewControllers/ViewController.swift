//
//  ViewController.swift
//  Coordinators
//
//  Created by clarknt on 2019-11-19.
//  Copyright © 2019 clarknt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    var buyAction: (() -> Void)?
    var createAccountAction: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buyTapped(_ sender: Any) {
        buyAction?()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        createAccountAction?()
    }
}

