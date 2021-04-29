//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by clarknt on 2019-11-19.
//  Copyright © 2019 clarknt. All rights reserved.
//

import Combine
import UIKit

class MainCoordinator: NSObject, Coordinator, Buying, AccountCreating {
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
  
  func childDidFinish(_ child: Coordinator?) {
    for (index, coordinator) in childCoordinators.enumerated() {
      if coordinator === child {
        childCoordinators.remove(at: index)
      }
    }
    
    print("Children coordinators count: \(childCoordinators.count)")
  }
  
  // MARK: - Navigation Instantiations and Events
  
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

// MARK: - UINavigationControllerDelegate

extension MainCoordinator: UINavigationControllerDelegate {
  func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
    // Detect whenever our controller is shown.
    guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
      return
    }
    
    // Check whether our vc array aleredy contains that viewController.
    // If it does, it means we're pushing our new VC on top, rather than popping it.
    
    if navigationController.viewControllers.contains(fromVC) {
      return
    }
    
    if let buyVC = fromVC as? BuyViewController {
      childDidFinish(buyVC.viewModel.coordinator)
    }
  }
}
