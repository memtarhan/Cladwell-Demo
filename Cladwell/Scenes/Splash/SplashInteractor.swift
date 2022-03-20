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
}

class SplashInteractorImpl: SplashInteractor {
    var presenter: SplashPresenter?
}
