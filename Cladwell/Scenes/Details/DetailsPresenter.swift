//
//  DetailsPresenter.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

protocol DetailsPresenter: AnyObject {
    var view: DetailsViewController? { get set }
    var interactor: DetailsInteractor? { get set }
    var router: DetailsRouter? { get set }
}

class DetailsPresenterImpl: DetailsPresenter {
    var view: DetailsViewController?
    var interactor: DetailsInteractor?
    var router: DetailsRouter?
}
