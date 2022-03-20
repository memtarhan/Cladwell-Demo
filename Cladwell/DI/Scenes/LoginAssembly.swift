//
//  LoginAssembly.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Swinject
import UIKit

class LoginAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LoginViewController.self) { r in
            let viewController = LoginViewControllerImpl(nibName: "LoginViewController", bundle: nil)
            let presenter = r.resolve(LoginPresenter.self)!
            let interactor = r.resolve(LoginInteractor.self)!
            let router = r.resolve(LoginRouter.self)!

            presenter.view = viewController
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            viewController.presenter = presenter
            router.view = viewController

            return viewController
        }

        container.register(LoginPresenter.self) { _ in
            LoginPresenterImpl()
        }

        container.register(LoginInteractor.self) { _ in
            LoginInteractorImpl()
        }

        container.register(LoginRouter.self) { r in
            LoginRouterImpl(factory: r.resolve(ViewControllerFactory.self)!)
        }
    }
}
