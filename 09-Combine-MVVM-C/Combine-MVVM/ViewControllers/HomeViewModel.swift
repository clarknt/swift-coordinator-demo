//
//  HomeViewModel.swift
//  Combine
//
//  Created by Glenn Posadas on 4/29/21.
//  Copyright © 2021 clarknt. All rights reserved.
//

import Combine
import Foundation

class HomeViewModel {
  let coordinator: MainCoordinator
  
  var buyActionPublisher = PassthroughSubject<Void, Never>()
  var createAccountActionPublisher = PassthroughSubject<Void, Never>()
  
  init(coordinator: MainCoordinator) {
    self.coordinator = coordinator
  }
}
