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

    func present(item: Int)
    func presentFetched(item: ItemResponse)
}

class DetailsPresenterImpl: DetailsPresenter {
    var view: DetailsViewController?
    var interactor: DetailsInteractor?
    var router: DetailsRouter?

    func present(item: Int) {
        interactor?.retrieveItem(for: item)
    }

    func presentFetched(item: ItemResponse) {
        if let image = item.image,
           let url = URL(string: image),
           let name = item.name {
            let viewModel = DetailsEntity.Item.ViewModel(name: name, image: url)
            view?.display(viewModel)
        }
    }
}
