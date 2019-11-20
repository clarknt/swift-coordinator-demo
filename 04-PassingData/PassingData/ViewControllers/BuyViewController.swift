//
//  BuyViewController.swift
//  Coordinators
//
//  Created by clarknt on 2019-11-19.
//  Copyright © 2019 clarknt. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {
    @IBOutlet weak var mainLabel: UILabel!

    weak var coordinator: MainCoordinator?

    var selectedProduct = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainLabel.text = "BUY PRODUCT #\(selectedProduct)"
    }
}
