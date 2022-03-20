//
//  SplashViewController.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol SplashViewController: AnyObject {
    var presenter: SplashPresenter? { get set }
}

class SplashViewControllerImpl: UIViewController {
    var presenter: SplashPresenter?

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

// MARK: - SplashViewController

extension SplashViewControllerImpl: SplashViewController {
}
