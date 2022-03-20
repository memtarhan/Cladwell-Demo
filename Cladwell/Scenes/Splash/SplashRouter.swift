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

    func navigateToLogin()
    func navigateToCloset()
}

class SplashRouterImpl: SplashRouter {
    var view: SplashViewController?

    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }

    func navigateToLogin() {
        guard let source = view as? UIViewController,
              let destination = factory.login as? UIViewController else { return }
        present(destination: destination, from: source)
    }

    func navigateToCloset() {
        guard let source = view as? UIViewController,
              let destination = factory.closet as? UIViewController else { return }
        presentNavigation(destination: destination, from: source)
    }
}
