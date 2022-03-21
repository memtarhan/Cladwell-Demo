//
//  UIView+.swift
//  Cladwell
//
//  Created by Mehmet Tarhan on 20/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

extension UIView {
    func makeCircle() {
        layer.cornerRadius = frame.height / 2
    }
}

extension UIView {
    func showLoadingIndicator() {
        let height = frame.height / 12
        let margin = height / 2

        DispatchQueue.main.async {
            let container = UIView(frame: self.bounds)
            container.tag = -11
            container.backgroundColor = .backgroundWithOpacity
            let spinner = Spinner(frame: CGRect(x: (self.frame.width / 2) - margin, y: (self.frame.height / 2) - margin, width: height, height: height))
            spinner.center = self.convert(self.center, from: self.superview)
            spinner.startRefreshing()
            container.addSubview(spinner)
            UIView.animate(withDuration: 0.3) {
                self.addSubview(container)
            }
        }
    }

    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                self.viewWithTag(-11)?.removeFromSuperview()
            }
        }
    }
}
