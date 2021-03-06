//
//  ClosetRouter.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol ClosetRouter: AnyObject {
    var view: ClosetViewController? { get set }

    func navigateToSplash()
    func navigateToDetails(for item: Int)
}

class ClosetRouterImpl: ClosetRouter {
    var view: ClosetViewController?

    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }

    func navigateToSplash() {
        guard let source = view as? UIViewController,
              let destination = factory.login as? UIViewController else { return }
        present(destination: destination, from: source)
    }

    func navigateToDetails(for item: Int) {
        let details = factory.details
        details.itemId = item
        guard let source = view as? UIViewController,
              let destination = details as? UIViewController else { return }
        push(destination: destination, from: source)
    }
}
