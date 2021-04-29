//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by clarknt on 2019-11-19.
//  Copyright © 2019 clarknt. All rights reserved.
//

import Combine
import UIKit

class MainCoordinator: Coordinator, Buying, AccountCreating {
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  
  var cancellables = Set<AnyCancellable>()
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let vc = HomeViewController.instantiate()
    let vm = HomeViewModel(coordinator: self)
    
    vc.viewModel = vm
    
    vc.viewModel.buyActionPublisher.sink {
      self.buySubscription()
    }
    .store(in: &cancellables)
    
    vc.viewModel.createAccountActionPublisher.sink {
      self.createAccount()
    }
    .store(in: &cancellables)
    
    navigationController.pushViewController(vc, animated: false)
  }
  
  func buySubscription() {
    let vc = BuyViewController.instantiate()
    let vm = BuyViewModel(coordinator: self)
    
    vc.viewModel = vm
    
    navigationController.pushViewController(vc, animated: true)
  }
  
  func createAccount() {
    let vc = CreateAccountViewController.instantiate()
    let vm = CreateAccountViewModel(coordinator: self)
    
    vc.viewModel = vm
    
    navigationController.pushViewController(vc, animated: true)
  }
}
