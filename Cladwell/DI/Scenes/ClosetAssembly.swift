//
//  ClosetAssembly.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Swinject
import UIKit

class ClosetAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ClosetViewController.self) { r in
            let viewController = ClosetViewControllerImpl(nibName: "ClosetViewController", bundle: nil)
            let presenter = r.resolve(ClosetPresenter.self)!
            let interactor = r.resolve(ClosetInteractor.self)!
            let router = r.resolve(ClosetRouter.self)!

            presenter.view = viewController
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            viewController.presenter = presenter
            router.view = viewController

            return viewController
        }

        container.register(ClosetPresenter.self) { _ in
            ClosetPresenterImpl()
        }

        container.register(ClosetInteractor.self) { _ in
            ClosetInteractorImpl()
        }

        container.register(ClosetRouter.self) { r in
            ClosetRouterImpl(factory: r.resolve(ViewControllerFactory.self)!)
        }
    }
}
