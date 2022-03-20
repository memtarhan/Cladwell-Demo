//
//  ClosetInteractor.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol ClosetInteractor: AnyObject {
    var presenter: ClosetPresenter? { get set }
}

class ClosetInteractorImpl: ClosetInteractor {
    var presenter: ClosetPresenter?
}
