//
//  RootCoordinator.swift
//  Combine-MVVM
//
//  Created by Glenn Posadas on 4/30/21.
//  Copyright © 2021 clarknt. All rights reserved.
//

import Combine
import UIKit

protocol RootPresenting {
  func startHomeFlow()
  func startAuthFlow()
  func endCurrentFlow()
}

class RootCoordinator: NSObject, Coordinator, RootPresenting {
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  
  private var currentCoordinatorFlow: Coordinator?
  
  var cancellables = Set<AnyCancellable>()
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let vc = RootViewController.instantiate()
    let vm = RootViewModel(coordinator: self)
    
    vc.viewModel = vm
    
    vc.viewModel.didLoginPublisher.sink {
      self.endCurrentFlow()
    }
    .store(in: &cancellables)
    
    vc.viewModel.didLogoutPublisher.sink {
      self.endCurrentFlow()
    }
    .store(in: &cancellables)
    
    vc.viewModel._viewDidAppear.sink {
      self.checkAuthState()
    }
    .store(in: &cancellables)
    
    navigationController.pushViewController(vc, animated: false)
  }
  
  func end() { }
  
  private func checkAuthState() {
    if Keychain.load(service: .userId) != nil {
      startHomeFlow()
    } else {
      startAuthFlow()
    }
  }
  
  // MARK: - Navigation Instantiations and Events
  
  func endCurrentFlow() {
//    currentCoordinatorFlow?.end?()
    
    navigationController.presentedViewController?.dismiss(animated: true, completion: nil)
  }
  
  func startHomeFlow() {
    currentCoordinatorFlow = HomeFlowCoordinator(navigationController: navigationController)
    currentCoordinatorFlow?.start()
  }
  
  func startAuthFlow() {
    currentCoordinatorFlow = AuthFlowCoordinator(navigationController: navigationController)
    currentCoordinatorFlow?.start()
  }
}
