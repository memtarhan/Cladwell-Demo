//
//  ClosetPresenter.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol ClosetPresenter: AnyObject {
    var view: ClosetViewController? { get set }
    var interactor: ClosetInteractor? { get set }
    var router: ClosetRouter? { get set }
}

class ClosetPresenterImpl: ClosetPresenter {
    var view: ClosetViewController?
    var interactor: ClosetInteractor?
    var router: ClosetRouter?
}
