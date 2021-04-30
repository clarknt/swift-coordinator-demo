//
//  Coordinated.swift
//  Combine-MVVM
//
//  Created by Glenn Posadas on 4/30/21.
//  Copyright © 2021 clarknt. All rights reserved.
//

import Foundation

protocol ViewModeled {
  var viewModel: Coordinated! { get set }
}

protocol Coordinated {
  var coordinator: NSObject & Coordinator { get set }
}
