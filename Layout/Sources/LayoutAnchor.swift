//
//  LayoutAnchor.swift
//  Layout
//
//  Created by Marco Capano on 17/12/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

///An anchor that can be constrained to be equal to, greater than and less ther another anchor.
public protocol LayoutAnchor {
    func constraint(equalTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
}

///A dimension that can be constrained to be equal to, greater than and less ther another dimension or constant value.
public protocol LayoutDimension {
    func constraint(equalToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(equalTo: Self, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint
    
    func constraint(greaterThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo: Self, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint
    
    func constraint(lessThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo: Self, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint
}

extension NSLayoutAnchor: LayoutAnchor {}
extension NSLayoutDimension: LayoutDimension {}
