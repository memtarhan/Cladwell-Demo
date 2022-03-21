//
//  CardView.swift
//  Cladwell
//
//  Created by Mehmet Tarhan on 21/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

class CardView: UIView {
    override func layoutSubviews() {
        layer.shadowColor = UIColor.lightText.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = 0.7
        layer.shadowOpacity = 0.7
    }
}
