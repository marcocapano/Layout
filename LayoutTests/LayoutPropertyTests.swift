//
//  LayoutPropertyTests.swift
//  LayoutTests
//
//  Created by Marco Capano on 20/12/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import XCTest
@testable import Layout

class LayoutPropertyTests: XCTestCase {
    
    var view: UIView!
    var superView: UIView!

    override func setUp() {
        superView = UIView()
        view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(view)
    }

    override func tearDown() {
        view.removeFromSuperview()
        view = nil
        superView = nil
    }
    
    func validate<A>(_ constraint: NSLayoutConstraint, lhs: AnyObject?, rhs: AnyObject?, firstAnchor: NSLayoutAnchor<A>, secondAnchor: NSLayoutAnchor<A>, offset: CGFloat = 0.0, relation: NSLayoutConstraint.Relation) {
        
        XCTAssertTrue(constraint.isActive)
        XCTAssertTrue(lhs === constraint.firstItem)
        XCTAssertTrue(rhs === constraint.secondItem)
        XCTAssertEqual(firstAnchor, constraint.firstAnchor)
        XCTAssertEqual(secondAnchor, constraint.secondAnchor)
        XCTAssertEqual(offset, constraint.constant)
        XCTAssertEqual(constraint.relation, relation)
    }
    
    func validate(_ constraint: NSLayoutConstraint, item: AnyObject?, dimension: NSLayoutAnchor<NSLayoutDimension>, constant: CGFloat, relation: NSLayoutConstraint.Relation) {
        
        XCTAssertTrue(constraint.isActive)
        XCTAssertTrue(constraint.firstItem === item)
        XCTAssertEqual(dimension, constraint.firstAnchor)
        XCTAssertNil(constraint.secondItem)
        XCTAssertNil(constraint.secondAnchor)
        XCTAssertEqual(constraint.constant, constant)
        XCTAssertEqual(constraint.relation, relation)
    }
    
    func validate<A>(_ constraint: NSLayoutConstraint, lhs: AnyObject?, rhs: AnyObject?, firstAnchor: NSLayoutAnchor<A>, secondAnchor: NSLayoutAnchor<A>, multiplier: CGFloat, constant: CGFloat = 0.0, relation: NSLayoutConstraint.Relation) {
        
        XCTAssertTrue(constraint.isActive)
        XCTAssertTrue(lhs === constraint.firstItem)
        XCTAssertTrue(rhs === constraint.secondItem)
        XCTAssertEqual(firstAnchor, constraint.firstAnchor)
        XCTAssertEqual(secondAnchor, constraint.secondAnchor)
        XCTAssertEqual(constraint.multiplier, multiplier, accuracy: 0.001)
        XCTAssertEqual(constant, constraint.constant)
        XCTAssertEqual(constraint.relation, relation)
    }

    //MARK: - Constraints to other Anchors
    func testEqualToWithOffset() {
        XCTAssertTrue(view.constraints.isEmpty)
        
        let constraint = view.layoutProxy.leading.equal(to: superView.leadingAnchor, offsetBy: 8)

        validate(constraint, lhs: view, rhs: superView, firstAnchor: view.leadingAnchor, secondAnchor: superView.leadingAnchor, offset: 8, relation: .equal)
    }
    
    func testGreaterThanWithOffset() {
        XCTAssertTrue(view.constraints.isEmpty)
        
        let constraint = view.layoutProxy.top.greaterThanOrEqual(to: superView.topAnchor, offsetBy: -4)
        
        validate(constraint, lhs: view, rhs: superView, firstAnchor: view.topAnchor, secondAnchor: superView.topAnchor, offset: -4, relation: .greaterThanOrEqual)
    }
    
    func testLessThanWithOffset() {
        XCTAssertTrue(view.constraints.isEmpty)
        
        let constraint = view.layoutProxy.bottom.lessThanOrEqual(to: superView.bottomAnchor, offsetBy: 2)
        
        validate(constraint, lhs: view, rhs: superView, firstAnchor: view.bottomAnchor, secondAnchor: superView.bottomAnchor, offset: 2, relation: .lessThanOrEqual)
    }
        
    //MARK: - Constraints to other anchors with multipliers
    func testEqualToWithMultiplier() {
        let constraint = view.layoutProxy.width.equal(to: superView.widthAnchor, multiplier: 0.5, constant: 10)
        
        validate(constraint, lhs: view, rhs: superView, firstAnchor: view.widthAnchor, secondAnchor: superView.widthAnchor, multiplier: 0.5, constant: 10, relation: .equal)
    }
    
    func testLessThanOrEqualToWithMultiplier() {
        let constraint = view.layoutProxy.width.lessThanOrEqual(to: superView.widthAnchor, multiplier: 0.2, offsetBy: -5)
        
        validate(constraint, lhs: view, rhs: superView, firstAnchor: view.widthAnchor, secondAnchor: superView.widthAnchor, multiplier: 0.2, constant: -5, relation: .lessThanOrEqual)
    }
    
    func testGreaterThanOrEqualToWithMultiplier() {
        let constraint = view.layoutProxy.height.greaterThanOrEqual(to: superView.heightAnchor, multiplier: 1.5, offsetBy: 0)
        
        validate(constraint, lhs: view, rhs: superView, firstAnchor: view.heightAnchor, secondAnchor: superView.heightAnchor, multiplier: 1.5, relation: .greaterThanOrEqual)
    }
    
    
    //MARK: - Constraints to constant values
    func testEqualToConstant() {
        XCTAssertTrue(view.constraints.isEmpty)
        
        let constraint = view.layoutProxy.width.equal(to: 300)
        validate(constraint, item: view, dimension: view.widthAnchor, constant: 300, relation: .equal)
    }
    
    func testLessThanOrEqualToConstant() {
        XCTAssertTrue(view.constraints.isEmpty)
        
        let constraint = view.layoutProxy.height.lessThanOrEqual(to: 50)
        validate(constraint, item: view, dimension: view.heightAnchor, constant: 50, relation: .lessThanOrEqual)
    }
    
    func testGreaterThanOrEqualToConstant() {
        XCTAssertTrue(view.constraints.isEmpty)
        
        let constraint = view.layoutProxy.height.greaterThanOrEqual(to: 412)
        validate(constraint, item: view, dimension: view.heightAnchor, constant: 412, relation: .greaterThanOrEqual)
    }

}
