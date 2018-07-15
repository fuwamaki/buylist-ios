//
//  UIView+Addition.swift
//  BuyList
//
//  Created by 牧宥作 on 2018/05/26.
//  Copyright © 2018年 牧 宥作. All rights reserved.
//

import UIKit

extension UIView {

    public struct LayoutMarginOptions: OptionSet {
        public var rawValue: Int
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        static public let left = LayoutMarginOptions(rawValue: 1 << 0)
        static public let right = LayoutMarginOptions(rawValue: 1 << 1)
        static public let top = LayoutMarginOptions(rawValue: 1 << 2)
        static public let bottom = LayoutMarginOptions(rawValue: 1 << 3)
        static public let all: LayoutMarginOptions = [.left, .right, .top, .bottom]
    }

    @discardableResult
    public func pinSubview(_ subview: UIView,
                           margin: UIEdgeInsets = .zero,
                           maximumSubViewWidth: CGFloat? = nil,
                           onLayoutMargin: LayoutMarginOptions = [],
                           at atIndex: Int? = nil) ->
        (topConstraint: NSLayoutConstraint,
        leftConstraint: NSLayoutConstraint,
        bottomConstraint: NSLayoutConstraint,
        rightConstraint: NSLayoutConstraint) {
            subview.translatesAutoresizingMaskIntoConstraints = false

            if let atIndex = atIndex {
                insertSubview(subview, at: atIndex)
            } else {
                addSubview(subview)
            }

            let leftConstraint: NSLayoutConstraint!
            let rightConstraint: NSLayoutConstraint!
            let topConstraint: NSLayoutConstraint!
            let bottomConstraint: NSLayoutConstraint!
            let guide = layoutMarginsGuide

            // pin left and right
            if let maximumSubViewWidth = maximumSubViewWidth {
                // Constraint to limite the size less than super view size.
                leftConstraint = subview.leftAnchor.constraint(greaterThanOrEqualTo: onLayoutMargin.contains(.left) ? guide.leftAnchor : leftAnchor, constant: margin.left)
                leftConstraint.isActive = true

                rightConstraint = subview.rightAnchor.constraint(greaterThanOrEqualTo: onLayoutMargin.contains(.right) ? guide.rightAnchor : rightAnchor, constant: -margin.right)
                rightConstraint.isActive = true

                subview.widthAnchor.constraint(equalToConstant: maximumSubViewWidth).isActive = true
                subview.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            } else {
                // Constraint to stretch the subview to superview horizontally.
                leftConstraint = subview.leftAnchor.constraint(equalTo: onLayoutMargin.contains(.left) ? guide.leftAnchor : leftAnchor, constant: margin.left)
                leftConstraint.isActive = true

                rightConstraint = subview.rightAnchor.constraint(equalTo: onLayoutMargin.contains(.right) ? guide.rightAnchor : rightAnchor, constant: -margin.right)
                rightConstraint.isActive = true
            }

            // pin top
            topConstraint = subview.topAnchor.constraint(equalTo: onLayoutMargin.contains(.top) ? guide.topAnchor : topAnchor, constant: margin.top)
            topConstraint.isActive = true
            // pin bottom
            bottomConstraint = subview.bottomAnchor.constraint(equalTo: onLayoutMargin.contains(.bottom) ? guide.bottomAnchor : bottomAnchor, constant: -margin.bottom)
            bottomConstraint.isActive = true

            return (topConstraint, leftConstraint, bottomConstraint, rightConstraint)
    }
}
