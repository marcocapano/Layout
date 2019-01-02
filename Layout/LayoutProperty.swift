//
//  LayoutProperty.swift
//  Layout
//
//  Created by Marco Capano on 17/12/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

/// A wrapper around a Layout Anchor.
public struct LayoutProperty<Anchor: LayoutAnchor> {
    let anchor: Anchor
}

public extension LayoutProperty {
    
    //MARK: - Constraint anchors to other anchors
    
    /// Constraints the anchor to be equal to the given anchor, with an offset.
    ///
    /// - Parameters:
    ///   - otherAnchor: The anchor to which you want to constraint.
    ///   - constant: The constant offset for the constraint. Can be both positive or negative, default is **0**.
    /// - Returns: The added constraint.
    @discardableResult
    public func equal(to otherAnchor: Anchor, offsetBy
        constant: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint = anchor.constraint(equalTo: otherAnchor,
                          constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    /// Constraints the anchor to be greater than or equal to the given anchor, with an offset.
    ///
    /// - Parameters:
    ///   - otherAnchor: The anchor to which you want to constraint.
    ///   - constant: The constant offset for the constraint. Can be both positive or negative, default is **0**.
    /// - Returns: The added constraint.
    @discardableResult
    public func greaterThanOrEqual(to otherAnchor: Anchor,
                            offsetBy constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(greaterThanOrEqualTo: otherAnchor,
                          constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    /// Constraints the anchor to be less then or equal to the given anchor, with an offset.
    ///
    /// - Parameters:
    ///   - otherAnchor: The anchor to which you want to constraint.
    ///   - constant: The constant offset for the constraint. Can be both positive or negative, default is **0**.
    /// - Returns: The added constraint.
    @discardableResult
    public func lessThanOrEqual(to otherAnchor: Anchor,
                         offsetBy constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(lessThanOrEqualTo: otherAnchor,
                          constant: constant)
        constraint.isActive = true
        return constraint
    }
}

public extension LayoutProperty where Anchor: LayoutDimension {
    
    //MARK: - Constraint anchors to constant values
    
    /// Constraints the dimension to be equal to a constant value.
    ///
    /// - Parameter constant: The constant value.
    /// - Returns: The added constraint.
    @discardableResult
    public func equal(to constant: CGFloat) -> NSLayoutConstraint {
        let constraint = anchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    /// Constraints the dimension to be less than or equal to a constant value.
    ///
    /// - Parameter constant: The constant value.
    /// - Returns: The added constraint.
    @discardableResult
    public func lessThanOrEqual(to constant: CGFloat) -> NSLayoutConstraint {
        let constraint = anchor.constraint(lessThanOrEqualToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    /// Constraints the dimension to be greater than or equal to a constant value.
    ///
    /// - Parameter constant: The constant value.
    /// - Returns: The added constraint.
    @discardableResult
    public func greaterThanOrEqual(to constant: CGFloat) -> NSLayoutConstraint {
        let constraint = anchor.constraint(greaterThanOrEqualToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    //MARK: - Constraint anchors to scaled anchors
    
    /// Constraints the dimension to be equal to a scaled value of another anchor, with an offset.

    ///
    /// - Parameters:
    ///   - dimension: The anchor to which you want to constraint.
    ///   - multiplier: The scaling factor. For example a scaling factor of 0.5 for a width anchor results in the receiver having half the width of the given anchor.
    ///   - constant: The constant offset for the constraint. Can be both positive or negative, default is **0**.
    /// - Returns: The added constraint.
    @discardableResult
    public func equal(to dimension: Anchor, multiplier: CGFloat, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(equalTo: dimension, multiplier: multiplier, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    /// Constraints the dimension to be greater than or equal to a scaled value of another anchor, with an offset.
    
    ///
    /// - Parameters:
    ///   - dimension: The anchor to which you want to constraint.
    ///   - multiplier: The scaling factor. For example a scaling factor of 0.5 for a width anchor results in the receiver having half the width of the given anchor.
    ///   - constant: The constant offset for the constraint. Can be both positive or negative, default is **0**.
    /// - Returns: The added constraint.
    @discardableResult
    public func greaterThanOrEqual(to dimension: Anchor, multiplier: CGFloat, offsetBy constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(greaterThanOrEqualTo: dimension, multiplier: multiplier,
                          constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    /// Constraints the dimension to be less than or equal to a scaled value of another anchor, with an offset.
    
    ///
    /// - Parameters:
    ///   - dimension: The anchor to which you want to constraint.
    ///   - multiplier: The scaling factor. For example a scaling factor of 0.5 for a width anchor results in the receiver having half the width of the given anchor.
    ///   - constant: The constant offset for the constraint. Can be both positive or negative, default is **0**.
    /// - Returns: The added constraint.
    @discardableResult
    public func lessThanOrEqual(to dimension: Anchor, multiplier: CGFloat, offsetBy constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let constraint = anchor.constraint(lessThanOrEqualTo: dimension, multiplier: multiplier, constant: constant)
        constraint.isActive = true
        return constraint
    }
}

