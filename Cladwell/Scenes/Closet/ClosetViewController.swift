//
//  ClosetViewController.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Combine
import UIKit

protocol ClosetViewController: AnyObject {
    var presenter: ClosetPresenter? { get set }
}

class ClosetViewControllerImpl: UIViewController {
    var presenter: ClosetPresenter?

    @IBOutlet var collectionView: UICollectionView!

    private var cancellables: Set<AnyCancellable> = []

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

        let backBarButtonItem = UIBarButtonItem(image: UIImage(named: ""), style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .neutralBlack
        navigationItem.backBarButtonItem = backBarButtonItem

       
        
        // TODO: Setup title view with button
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

        let cell = UINib(nibName: ItemCollectionViewCell.nibIdentifier, bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: ItemCollectionViewCell.reuseIdentifier)
        collectionView.delegate = self

        presenter?.triggerPublisher
            .receive(on: RunLoop.main)
            .sink { _ in
            }.store(in: &cancellables)

        presenter?.fetchCompletionPublisher
            .receive(on: RunLoop.main)
            .sink { result in
                if result {
                    self.view.hideLoadingIndicator()

                } else {
                    self.view.showLoadingIndicator()
                }

            }.store(in: &cancellables)

        presenter?.diffableDataSource = ItemsCollectionViewDiffableDataSource(collectionView: collectionView) { (collectionView, indexPath, model) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.reuseIdentifier, for: indexPath) as? ItemCollectionViewCell
            else { return UICollectionViewCell() }

            cell.configure(model)
            return cell
        }
    }
}

// MARK: - ClosetViewController

extension ClosetViewControllerImpl: ClosetViewController {
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ClosetViewControllerImpl: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.presentDetails()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width / 2, height: size.height / 2.5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
