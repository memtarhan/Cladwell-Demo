//
//  SplashInteractor.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol SplashInteractor: AnyObject {
    var presenter: SplashPresenter? { get set }

    var isLoggedIn: Bool { get }
}

class SplashInteractorImpl: SplashInteractor {
    var presenter: SplashPresenter?

    var isLoggedIn: Bool {
        // TODO: Implement actual check func.
        return true
    }
}
