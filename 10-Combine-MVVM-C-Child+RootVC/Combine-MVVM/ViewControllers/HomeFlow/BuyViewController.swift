//
//  BuyViewController.swift
//  Coordinators
//
//  Created by clarknt on 2019-11-19.
//  Copyright © 2019 clarknt. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded, ViewModeled {
  var viewModel: Coordinated!
  
  deinit {
    print("Deinit \(self)")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}
