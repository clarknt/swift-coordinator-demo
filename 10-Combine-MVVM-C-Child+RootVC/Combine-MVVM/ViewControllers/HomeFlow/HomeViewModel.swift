//
//  HomeViewModel.swift
//  Combine
//
//  Created by Glenn Posadas on 4/29/21.
//  Copyright © 2021 clarknt. All rights reserved.
//

import Combine
import Foundation

class HomeViewModel: Coordinated {
  var coordinator: NSObject & Coordinator
    
  var buyActionPublisher = PassthroughSubject<Void, Never>()
  var createAccountActionPublisher = PassthroughSubject<Void, Never>()
  
  deinit {
    print("Deinit \(self)")
  }
  
  init(coordinator: HomeFlowCoordinator) {
    self.coordinator = coordinator
  }
  
  func logout() {
    Keychain.delete(service: .userId)
    NotificationCenter.default.post(name: .didLogout, object: nil)
  }
}
