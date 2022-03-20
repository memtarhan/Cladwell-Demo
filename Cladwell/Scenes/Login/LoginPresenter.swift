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
}

class LoginPresenterImpl: LoginPresenter {
    var view: LoginViewController?
    var interactor: LoginInteractor?
    var router: LoginRouter?
}
