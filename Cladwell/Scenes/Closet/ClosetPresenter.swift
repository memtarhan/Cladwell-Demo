//
//  ClosetPresenter.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Combine
import UIKit

protocol ClosetPresenter: AnyObject {
    var view: ClosetViewController? { get set }
    var interactor: ClosetInteractor? { get set }
    var router: ClosetRouter? { get set }

    var triggerPublisher: Published<Bool>.Publisher { get }
    var fetchCompletionPublisher: Published<Bool>.Publisher { get }
    var diffableDataSource: ItemsCollectionViewDiffableDataSource? { get set }

    func presentLogOut()
    func presentLoggedOut()
    func presentFetched(closet: ClosetResponse)
    func presentDetails(for item: Int)
}

class ClosetPresenterImpl: ClosetPresenter {
    var view: ClosetViewController?
    var interactor: ClosetInteractor?
    var router: ClosetRouter?

    private var cancellables: Set<AnyCancellable> = []
    @Published var trigger: Bool = false
    var triggerPublisher: Published<Bool>.Publisher { $trigger }

    @Published var fetched: Bool = false
    var fetchCompletionPublisher: Published<Bool>.Publisher { $fetched }
    var diffableDataSource: ItemsCollectionViewDiffableDataSource?
    var snapshot = NSDiffableDataSourceSnapshot<String?, ClosetEntity.Item.ViewModel>()

    init() {
        triggerPublisher.receive(on: RunLoop.main).debounce(for: .seconds(0.0), scheduler: RunLoop.main)
            .sink { _ in
                self.fetchCloset()
            }.store(in: &cancellables)

        fetchCompletionPublisher.receive(on: RunLoop.main).debounce(for: .seconds(0.0), scheduler: RunLoop.main)
            .sink { _ in
            }.store(in: &cancellables)
    }

    func presentLogOut() {
        interactor?.logOut()
    }

    func presentLoggedOut() {
        router?.navigateToSplash()
    }

    func presentFetched(closet: ClosetResponse) {
        fetched = true
        snapshot.deleteAllItems()
        snapshot.appendSections([""])

        if closet.items.isEmpty {
            diffableDataSource?.apply(snapshot, animatingDifferences: true)
            return
        }

        let viewModels = closet.items.map { item -> ClosetEntity.Item.ViewModel in
            ClosetEntity.Item.ViewModel(id: item.id, name: item.name, image: item.image)
        }
        snapshot.appendItems(viewModels, toSection: "")
        diffableDataSource?.apply(snapshot, animatingDifferences: true)
    }

    func presentDetails(for item: Int) {
        router?.navigateToDetails(for: item)
    }

    private func fetchCloset() {
        interactor?.retrieveCloset()
    }
}
