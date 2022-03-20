//
//  SplashRouter.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol SplashRouter: AnyObject {
    var view: SplashViewController? { get set }
}

class SplashRouterImpl: SplashRouter {
    var view: SplashViewController?

    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
}
