//
//  Coordinator.swift
//  Coordinators
//
//  Created by clarknt on 2019-11-19.
//  Copyright © 2019 clarknt. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var Protocols: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
