//
//  LoginPresenter.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol LoginPresenter: AnyObject {
    var view: LoginViewController? { get set }
    var interactor: LoginInteractor? { get set }
    var router: LoginRouter? { get set }

    func present(email: String?, password: String?)
    func presentLoggedIn()
    func presentLoginFailed()
}

class LoginPresenterImpl: LoginPresenter {
    var view: LoginViewController?
    var interactor: LoginInteractor?
    var router: LoginRouter?

    func present(email: String?, password: String?) {
        if let email = email,
           email != "",
           let password = password,
           password != "" {
            interactor?.signIn(withEmail: email, password: password)
        } else {
            let error = LoginEntity.Error.ViewModel(title: "Oops, Failed to login", message: "Email and password should not be empty")
            view?.display(error)
        }
    }

    func presentLoggedIn() {
        view?.stopLoadingIndicator()
        router?.navigateToCloset()
    }

    func presentLoginFailed() {
        let error = LoginEntity.Error.ViewModel(title: "Oops, Failed to login", message: "Please, try again.")
        view?.display(error)
    }
}
