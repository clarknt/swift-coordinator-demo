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
        let vc = ViewController.instantiate()
        vc.buyActionPublisher.sink {
            self.buySubscription()
        }
        .store(in: &cancellables)
        
        vc.createAccountActionPublisher.sink {
            self.createAccount()
        }
        .store(in: &cancellables)
        
        navigationController.pushViewController(vc, animated: false)
    }

    func buySubscription() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
