//
//  RootViewModel.swift
//  Combine-MVVM
//
//  Created by Glenn Posadas on 4/30/21.
//  Copyright © 2021 clarknt. All rights reserved.
//

import Combine
import Foundation

extension Notification.Name {
  static let didLogin = NSNotification.Name("didLogin")
  static let didLogout = NSNotification.Name("didLogout")
}

class RootViewModel {
  let coordinator: RootCoordinator
  
  var didLoginPublisher = PassthroughSubject<Void, Never>()
  var didLogoutPublisher = PassthroughSubject<Void, Never>()
  /// Called by the `RootViewController`
  /// The `RootCoordinator` is observing this subject.
  var _viewDidAppear = PassthroughSubject<Void, Never>()
  
  var cancellables = Set<AnyCancellable>()
  
  init(coordinator: RootCoordinator) {
    self.coordinator = coordinator
    
    NotificationCenter.default
      .publisher(for: .didLogin)
      .sink() { _ in
        self.didLoginPublisher.send()
      }.store(in: &cancellables)
    
    NotificationCenter.default
      .publisher(for: .didLogout)
      .sink() { _ in
        self.didLogoutPublisher.send()
      }.store(in: &cancellables)
  }
  
  // MARK: - Controller life cycle
  
  func viewDidAppear() {
    _viewDidAppear.send()
  }
}
