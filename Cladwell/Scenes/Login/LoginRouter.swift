//
//  LoginRouter.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol LoginRouter: AnyObject {
    var view: LoginViewController? { get set }

    func navigateToCloset()
}

class LoginRouterImpl: LoginRouter {
    var view: LoginViewController?

    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }

    func navigateToCloset() {
        guard let source = view as? UIViewController,
              let destination = factory.closet as? UIViewController else { return }
        presentNavigation(destination: destination, from: source)
    }
}
