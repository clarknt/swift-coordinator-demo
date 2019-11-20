//
//  ViewController.swift
//  Coordinators
//
//  Created by clarknt on 2019-11-19.
//  Copyright © 2019 clarknt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    @IBOutlet weak var product: UISegmentedControl!

    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.buySubscription(to: product.selectedSegmentIndex)
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        coordinator?.createAccount()
    }
}

