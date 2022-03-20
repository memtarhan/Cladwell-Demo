//
//  ClosetViewController.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol ClosetViewController: AnyObject {
    var presenter: ClosetPresenter? { get set }
}

class ClosetViewControllerImpl: UIViewController {
    var presenter: ClosetPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localize()
    }

    private func setup() {
        view.backgroundColor = .accent
    }

    private func localize() {
    }
}

// MARK: - ClosetViewController

extension ClosetViewControllerImpl: ClosetViewController {
}
