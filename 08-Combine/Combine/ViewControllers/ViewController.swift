//
//  ViewController.swift
//  Coordinators
//
//  Created by clarknt on 2019-11-19.
//  Copyright © 2019 clarknt. All rights reserved.
//

import Combine
import UIKit

class ViewController: UIViewController, Storyboarded {
    var buyActionPublisher = PassthroughSubject<Void, Never>()
    var createAccountActionPublisher = PassthroughSubject<Void, Never>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buyTapped(_ sender: Any) {
        buyActionPublisher.send()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        createAccountActionPublisher.send()
    }
}

