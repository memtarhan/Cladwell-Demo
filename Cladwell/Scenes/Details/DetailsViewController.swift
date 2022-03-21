//
//  DetailsViewController.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit
import Kingfisher

protocol DetailsViewController: AnyObject {
    var presenter: DetailsPresenter? { get set }

    var itemId: Int! { get set }

    func display(_ item: DetailsEntity.Item.ViewModel)
}

class DetailsViewControllerImpl: UIViewController {
    var presenter: DetailsPresenter?

    var itemId: Int!

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet weak var saveItemButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        saveItemButton.makeCircle()
        
        presenter?.present(item: itemId)
    }
}

// MARK: - DetailsViewController

extension DetailsViewControllerImpl: DetailsViewController {
    func display(_ item: DetailsEntity.Item.ViewModel) {
        DispatchQueue.main.async {
            self.nameTextField.text = item.name
            self.imageView.kf.setImage(with: item.image)
        }
    }
}
