//
//  UIEdgeInsets+Equatable.swift
//  BubbleHeader
//
//  Created by Ramon Vasconcelos on 17/12/2018.
//

import UIKit

public func + (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
    return UIEdgeInsets(
        top: lhs.top + rhs.top,
        left: lhs.left + rhs.left,
        bottom: lhs.bottom + rhs.bottom,
        right: lhs.right + rhs.right
    )
}

public func - (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
    return UIEdgeInsets(
        top: lhs.top - rhs.top,
        left: lhs.left - rhs.left,
        bottom: lhs.bottom - rhs.bottom,
        right: lhs.right - rhs.right
    )
}
