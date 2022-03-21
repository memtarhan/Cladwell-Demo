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

    // MARK: - Actions

    @objc private func didTapLogOut(_ sender: UIBarButtonItem) {
        presenter?.presentLogOut()
    }

    private func setup() {
        view.backgroundColor = .accent

        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "LogOut"), style: .plain, target: self, action: #selector(didTapLogOut(_:)))
        leftBarButtonItem.tintColor = .neutralBlack
        navigationItem.leftBarButtonItem = leftBarButtonItem

        let titleView = UIView()
        titleView.backgroundColor = .white

        let stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 240, height: 64))
        stackView.spacing = 12

        let label = UILabel()
        label.text = "Closet"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        stackView.addArrangedSubview(label)

        let imageView = UIImageView(image: UIImage(named: "ChevronDown"))
        stackView.addArrangedSubview(imageView)

        titleView.addSubview(stackView)
        titleView.makeCircle()

//        navigationItem.titleView = titleView
    }
}

// MARK: - ClosetViewController

extension ClosetViewControllerImpl: ClosetViewController {
}
