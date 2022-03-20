//
//  LoginInteractor.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol LoginInteractor: AnyObject {
    var presenter: LoginPresenter? { get set }
}

class LoginInteractorImpl: LoginInteractor {
    var presenter: LoginPresenter?
}
