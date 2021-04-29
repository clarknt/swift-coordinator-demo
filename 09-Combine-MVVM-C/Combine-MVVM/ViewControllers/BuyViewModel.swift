//
//  BuyViewModel.swift
//  Combine
//
//  Created by Glenn Posadas on 4/29/21.
//  Copyright © 2021 clarknt. All rights reserved.
//

import Foundation

class BuyViewModel {
  let coordinator: MainCoordinator
  
  deinit {
    print("Deinit \(self)")
  }
  
  init(coordinator: MainCoordinator) {
    self.coordinator = coordinator
  }
}
