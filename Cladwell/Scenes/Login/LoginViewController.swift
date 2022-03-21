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

    @IBOutlet var emailAddressTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!

    @IBOutlet var loginButtonBottomConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    @IBAction func didTapLogin(_ sender: UIButton) {
        view.showLoadingIndicator()
    }

    private func setup() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        loginButtonBottomConstraint.isActive = true

        loginButton.makeCircle()
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            loginButtonBottomConstraint.constant = keyboardSize.height + 64
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        loginButtonBottomConstraint.constant = 32
    }
}

// MARK: - LoginViewController

extension LoginViewControllerImpl: LoginViewController {
}
