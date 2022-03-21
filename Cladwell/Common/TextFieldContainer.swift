//
//  TextFieldContainer.swift
//  Cladwell
//
//  Created by Mehmet Tarhan on 21/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

class TextFieldContainer: UIView {
    override func layoutSubviews() {
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.3
        layer.cornerRadius = frame.height / 2
    }
}
