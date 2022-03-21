//
//  Router.swift
//  Cladwell
//
//  Created by Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

func present(destination: UIViewController, from source: UIViewController) {
    destination.modalTransitionStyle = .crossDissolve
    destination.modalPresentationStyle = .fullScreen

    source.present(destination, animated: true)
}

func presentNavigation(destination: UIViewController, from source: UIViewController) {
    let navigationController = UINavigationController(rootViewController: destination)
    navigationController.modalTransitionStyle = .crossDissolve
    navigationController.modalPresentationStyle = .fullScreen

    source.present(navigationController, animated: true)
}

func push(destination: UIViewController, from source: UIViewController) {
    source.navigationController?.pushViewController(destination, animated: true)
}
