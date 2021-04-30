//
//  HomeFlowCoordinator.swift
//  Coordinators
//
//  Created by clarknt on 2019-11-19.
//  Copyright © 2019 clarknt. All rights reserved.
//

import Combine
import UIKit

class HomeFlowCoordinator: NSObject, Coordinator, Buying, AccountCreating {
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  
  var cancellables = Set<AnyCancellable>()
  
  deinit {
    print("Deinit \(self)")
  }
  
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
    
    let newNavCon = UINavigationController(rootViewController: vc)
    newNavCon.modalTransitionStyle = .crossDissolve
    newNavCon.modalPresentationStyle = .fullScreen
    
    navigationController.present(newNavCon, animated: true, completion: nil)
  }
  
  func end() {
    navigationController.presentingViewController?.dismiss(animated: true, completion: nil)
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
