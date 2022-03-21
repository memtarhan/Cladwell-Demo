//
//  UIColor+.swift
//  Cladwell
//
//  Created by Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

extension UIColor {
    open class var accent: UIColor? { UIColor(named: "AccentColor") }
    open class var background: UIColor? { UIColor(named: "BackgroundColor") }
    open class var backgroundWithOpacity: UIColor? { return UIColor(named: "BackgroundWithOpacityColor") }
    open class var neutralBlack: UIColor? { return UIColor(named: "NeutralBlackColor") }
}
