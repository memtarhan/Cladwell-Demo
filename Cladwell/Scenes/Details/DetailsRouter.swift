//
//  DetailsRouter.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol DetailsRouter: AnyObject {
    var view: DetailsViewController? { get set }
}

class DetailsRouterImpl: DetailsRouter {
    var view: DetailsViewController?

    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
}
