//
//  SplashAssembly.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Swinject
import UIKit

class SplashAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SplashViewController.self) { r in
            let viewController = SplashViewControllerImpl(nibName: "SplashViewController", bundle: nil)
            let presenter = r.resolve(SplashPresenter.self)!
            let interactor = r.resolve(SplashInteractor.self)!
            let router = r.resolve(SplashRouter.self)!

            presenter.view = viewController
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            viewController.presenter = presenter
            router.view = viewController

            return viewController
        }

        container.register(SplashPresenter.self) { _ in
            SplashPresenterImpl()
        }

        container.register(SplashInteractor.self) { _ in
            SplashInteractorImpl()
        }

        container.register(SplashRouter.self) { r in
            SplashRouterImpl(factory: r.resolve(ViewControllerFactory.self)!)
        }
    }
}
