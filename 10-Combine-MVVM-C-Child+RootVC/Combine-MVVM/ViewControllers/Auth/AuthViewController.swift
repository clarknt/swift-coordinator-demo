//
//  AuthViewController.swift
//  Combine-MVVM
//
//  Created by Glenn Posadas on 4/30/21.
//  Copyright © 2021 clarknt. All rights reserved.
//

import Combine
import UIKit

// AUTH COORDINATOR

class AuthFlowCoordinator: NSObject, Coordinator {
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
    let vc = AuthViewController.instantiate()
    let vm = AuthViewModel(coordinator: self)
    
    vc.viewModel = vm
    
    let newNavCon = UINavigationController(rootViewController: vc)
    newNavCon.modalTransitionStyle = .crossDissolve
    newNavCon.modalPresentationStyle = .fullScreen
    
    navigationController.present(newNavCon, animated: true, completion: nil)
  }
  
  func end() {
    navigationController.presentingViewController?.dismiss(animated: true, completion: nil)
  }
}

// VIEWMODEL

class AuthViewModel: Coordinated {
  var coordinator: NSObject & Coordinator
  
  deinit {
    print("Deinit \(self)")
  }
  
  init(coordinator: AuthFlowCoordinator) {
    self.coordinator = coordinator
  }
  
  func login() {
    Keychain.save(service: .userId, data: "1")
    NotificationCenter.default.post(name: .didLogin, object: nil)
  }
}

// CONTROLLER

class AuthViewController: UIViewController, ViewModeled, Storyboarded {
  var viewModel: Coordinated!
  
  deinit {
    print("Deinit \(self)")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func loginTapped(_ sender: Any) {
    (viewModel as! AuthViewModel).login()
  }
}
