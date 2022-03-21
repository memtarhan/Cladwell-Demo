//
//  Spinner.swift
//  Cladwell
//
//  Created by Mehmet Tarhan on 21/03/2022.
//  Copyright © 2022 MEMTARHAN. All rights reserved.
//

import UIKit

open class Spinner: UIView {
    public let circleLayer = CAShapeLayer()
    open private(set) var isAnimating = false
    open var animationDuration: TimeInterval = 2.0

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    open func commonInit() {
        layer.addSublayer(circleLayer)

        backgroundColor = .clear

        circleLayer.fillColor = nil
        circleLayer.lineWidth = 4.5

        circleLayer.strokeColor = UIColor.accent!.withAlphaComponent(0.8).cgColor
        circleLayer.strokeStart = 0
        circleLayer.strokeEnd = 0

        circleLayer.lineCap = .round
    }

    override open func layoutSubviews() {
        super.layoutSubviews()

        if circleLayer.frame != bounds {
            updateCircleLayer()
        }
    }

    open func updateCircleLayer() {
        let center = CGPoint(x: bounds.size.width / 2.0, y: bounds.size.height / 2.0)
        let radius = (bounds.height - circleLayer.lineWidth) / 2.0

        let startAngle: CGFloat = 0.0
        let endAngle: CGFloat = 2.0 * CGFloat.pi

        let path = UIBezierPath(arcCenter: center,
                                radius: radius,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)

        circleLayer.path = path.cgPath
        circleLayer.frame = bounds
    }

    open func forceBeginRefreshing() {
        isAnimating = false
        startRefreshing()
    }

    open func startRefreshing() {
        if isAnimating {
            return
        }

        isAnimating = true

        let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation")
        rotateAnimation.values = [
            0.0,
            Float.pi,
            2.0 * Float.pi,
        ]

        let headAnimation = CABasicAnimation(keyPath: "strokeStart")
        headAnimation.duration = (animationDuration / 2.0)
        headAnimation.fromValue = 0
        headAnimation.toValue = 0.25

        let tailAnimation = CABasicAnimation(keyPath: "strokeEnd")
        tailAnimation.duration = (animationDuration / 2.0)
        tailAnimation.fromValue = 0
        tailAnimation.toValue = 1

        let endHeadAnimation = CABasicAnimation(keyPath: "strokeStart")
        endHeadAnimation.beginTime = (animationDuration / 2.0)
        endHeadAnimation.duration = (animationDuration / 2.0)
        endHeadAnimation.fromValue = 0.25
        endHeadAnimation.toValue = 1

        let endTailAnimation = CABasicAnimation(keyPath: "strokeEnd")
        endTailAnimation.beginTime = (animationDuration / 2.0)
        endTailAnimation.duration = (animationDuration / 2.0)
        endTailAnimation.fromValue = 1
        endTailAnimation.toValue = 1

        let animations = CAAnimationGroup()
        animations.duration = animationDuration
        animations.animations = [
            rotateAnimation,
            headAnimation,
            tailAnimation,
            endHeadAnimation,
            endTailAnimation,
        ]
        animations.repeatCount = Float.infinity
        animations.isRemovedOnCompletion = false

        circleLayer.add(animations, forKey: "animations")
    }

    open func stopRefreshing() {
        isAnimating = false
        circleLayer.removeAnimation(forKey: "strokeEnd")
    }
}
