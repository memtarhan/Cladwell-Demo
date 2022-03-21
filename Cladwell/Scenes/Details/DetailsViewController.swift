//
//  DetailsViewController.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol DetailsViewController: AnyObject {
    var presenter: DetailsPresenter? { get set }
}

class DetailsViewControllerImpl: UIViewController {
    var presenter: DetailsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
    }
}

// MARK: - DetailsViewController

extension DetailsViewControllerImpl: DetailsViewController {
}
