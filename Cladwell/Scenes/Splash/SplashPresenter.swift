//
//  SplashPresenter.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol SplashPresenter: AnyObject {
    var view: SplashViewController? { get set }
    var interactor: SplashInteractor? { get set }
    var router: SplashRouter? { get set }

    func present()
}

class SplashPresenterImpl: SplashPresenter {
    var view: SplashViewController?
    var interactor: SplashInteractor?
    var router: SplashRouter?

    func present() {
        let isLoggedIn = interactor!.isLoggedIn
        if isLoggedIn {
            router?.navigateToCloset()

        } else {
            router?.navigateToLogin()
        }
    }
}
