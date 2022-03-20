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
}

class ClosetRouterImpl: ClosetRouter {
    var view: ClosetViewController?

    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
}
