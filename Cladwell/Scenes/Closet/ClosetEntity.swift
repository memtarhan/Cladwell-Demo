//
//  ClosetEntity.swift
//  Cladwell
//
//  Created Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

struct ClosetEntity {
    struct Item {
        struct ViewModel {
            var id: Int?
            var name: String?
            var image: String?
        }
    }
}

/// - to confirm UITableViewDiffableDataSource
extension ClosetEntity.Item.ViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: ClosetEntity.Item.ViewModel, rhs: ClosetEntity.Item.ViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
