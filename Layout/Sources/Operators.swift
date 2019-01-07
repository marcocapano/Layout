//
//  Operators.swift
//  Layout
//
//  Created by Marco Capano on 17/12/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

public struct ScaledDimension<Anchor: LayoutDimension> {
    let anchor: Anchor
    let multiplier: CGFloat
    let constant: CGFloat
    
    init(anchor: Anchor, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) {
        self.anchor = anchor
        self.multiplier = multiplier
        self.constant = constant
    }
}

//MARK: - SUM
public func +<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, rhs)
}

public func +<A: LayoutDimension>(lhs: ScaledDimension<A>, rhs: CGFloat) -> ScaledDimension<A> {
    return ScaledDimension(anchor: lhs.anchor, multiplier: lhs.multiplier, constant: rhs)
}

//MARK: - DIFFERENCE
public func -<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, -rhs)
}

public func -<A: LayoutDimension>(lhs: ScaledDimension<A>, rhs: CGFloat) -> ScaledDimension<A> {
    return ScaledDimension(anchor: lhs.anchor, multiplier: lhs.multiplier, constant: -rhs)
}

//MARK: - MULTIPLIER
public func *<A: LayoutDimension>(lhs: A, rhs: CGFloat) -> ScaledDimension<A> {
    return ScaledDimension(anchor: lhs, multiplier: rhs)
}

//MARK: - FRACTION
public func /<A: LayoutDimension>(lhs: A, rhs: CGFloat) -> ScaledDimension<A> {
    precondition(rhs != 0, "Dividing an anchor by 0 is impossible.")
    return ScaledDimension(anchor: lhs, multiplier: 1/rhs)
}

//MARK: - EQUALITY
public func ==<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: (A, CGFloat)) {
    lhs.equal(to: rhs.0, offsetBy: rhs.1)
}

public func ==<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.equal(to: rhs)
}

public func ==<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: CGFloat) {
    lhs.equal(to: rhs)
}

public func ==<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: ScaledDimension<A>) {
    lhs.equal(to: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant)
}

//MARK: - GREATER THAN OR EQUAL TO
public func >=<A: LayoutAnchor>(lhs: LayoutProperty<A>,
                         rhs: (A, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

public func >=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.greaterThanOrEqual(to: rhs)
}

public func >=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: CGFloat) {
    lhs.greaterThanOrEqual(to: rhs)
}

public func >=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: ScaledDimension<A>) {
    lhs.greaterThanOrEqual(to: rhs.anchor, multiplier: rhs.multiplier, offsetBy: rhs.constant)
}

//MARK: - LESS THAN OR EQUAL TO
public func <=<A: LayoutAnchor>(lhs: LayoutProperty<A>,
                         rhs: (A, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

public func <=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.lessThanOrEqual(to: rhs)
}

public func <=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: CGFloat) {
    lhs.lessThanOrEqual(to: rhs)
}

public func <=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: ScaledDimension<A>) {
    lhs.lessThanOrEqual(to: rhs.anchor, multiplier: rhs.multiplier, offsetBy: rhs.constant)
}

