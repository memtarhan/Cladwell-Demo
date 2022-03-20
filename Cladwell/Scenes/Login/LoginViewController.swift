//
//  LoginViewController.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol LoginViewController: AnyObject {
    var presenter: LoginPresenter? { get set }
}

class LoginViewControllerImpl: UIViewController {
    var presenter: LoginPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localize()
    }

    private func setup() {
    }

    private func localize() {
    }
}

// MARK: - LoginViewController

extension LoginViewControllerImpl: LoginViewController {
}
