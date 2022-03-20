//
//  DetailsInteractor.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol DetailsInteractor: AnyObject {
    var presenter: DetailsPresenter? { get set }
}

class DetailsInteractorImpl: DetailsInteractor {
    var presenter: DetailsPresenter?
}
