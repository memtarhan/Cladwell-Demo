//
//  ItemCollectionViewCell.swift
//  Cladwell
//
//  Created by Mehmet Tarhan on 21/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import Kingfisher
import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "Item"
    static let nibIdentifier = "ItemCollectionViewCell"

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ item: ClosetEntity.Item.ViewModel) {
        nameLabel.text = item.name
        if let image = item.image,
           let url = URL(string: image) {
            imageView.kf.setImage(with: url)
        }
    }
}

class ItemsCollectionViewDiffableDataSource: UICollectionViewDiffableDataSource<String?, ClosetEntity.Item.ViewModel> {}
