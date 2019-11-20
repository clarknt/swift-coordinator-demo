//
//  MainTabBarController.swift
//  TabBars
//
//  Created by clarknt on 2019-11-19.
//  Copyright © 2019 clarknt. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    let mainCoordinator = MainCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()

        mainCoordinator.start()
        viewControllers = [mainCoordinator.navigationController]
    }
}
