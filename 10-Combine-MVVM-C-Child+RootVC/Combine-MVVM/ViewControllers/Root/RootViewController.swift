//
//  RootViewController.swift
//  Combine-MVVM
//
//  Created by Glenn Posadas on 4/30/21.
//  Copyright © 2021 clarknt. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, Storyboarded {
  var viewModel: RootViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    viewModel.viewDidAppear()
  }
}
