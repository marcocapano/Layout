//
//  LayoutProperty.swift
//  Layout
//
//  Created by Marco Capano on 17/12/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

public struct LayoutProperty<Anchor: LayoutAnchor> {
    let anchor: Anchor
}

public extension LayoutProperty {
    func equal(to otherAnchor: Anchor, offsetBy
        constant: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint = anchor.constraint(equalTo: otherAnchor,
                          constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    func greaterThanOrEqual(to otherAnchor: Anchor,
                            offsetBy constant: CGFloat = 0) {
        anchor.constraint(greaterThanOrEqualTo: otherAnchor,
                          constant: constant).isActive = true
    }
    
    func lessThanOrEqual(to otherAnchor: Anchor,
                         offsetBy constant: CGFloat = 0) {
        anchor.constraint(lessThanOrEqualTo: otherAnchor,
                          constant: constant).isActive = true
    }
}

public extension LayoutProperty where Anchor: LayoutDimension {
    func equal(to constant: CGFloat) {
        anchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func lessThanOrEqual(to constant: CGFloat) {
        anchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
    }
    
    func greaterThanOrEqual(to constant: CGFloat) {
        anchor.constraint(greaterThanOrEqualToConstant: constant).isActive = false
    }
    
    
    func equal(to dimension: Anchor, multiplier: CGFloat, constant: CGFloat = 0.0) {
        anchor.constraint(equalTo: dimension, multiplier: multiplier, constant: constant).isActive = true
    }
    
    func greaterThanOrEqual(to dimension: Anchor, multiplier: CGFloat, offsetBy constant: CGFloat = 0.0) {
        anchor.constraint(greaterThanOrEqualTo: dimension, multiplier: multiplier,
                          constant: constant).isActive = true
    }
    
    func lessThanOrEqual(to dimension: Anchor, multiplier: CGFloat, offsetBy constant: CGFloat = 0.0) {
        anchor.constraint(lessThanOrEqualTo: dimension, multiplier: multiplier, constant: constant).isActive = true
    }
}

