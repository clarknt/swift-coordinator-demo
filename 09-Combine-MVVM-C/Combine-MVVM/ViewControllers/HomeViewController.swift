//
//  HomeViewController.swift
//  Coordinators
//
//  Created by clarknt on 2019-11-19.
//  Copyright © 2019 clarknt. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded {
  var viewModel: HomeViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func buyTapped(_ sender: Any) {
    viewModel.buyActionPublisher.send()
  }
  
  @IBAction func createAccountTapped(_ sender: Any) {
    viewModel.createAccountActionPublisher.send()
  }
}

