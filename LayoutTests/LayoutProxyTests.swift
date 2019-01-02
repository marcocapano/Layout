//
//  LayoutProxyTests.swift
//  LayoutTests
//
//  Created by Marco Capano on 20/12/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import XCTest

class LayoutProxyTests: XCTestCase {

    func testProxyCreation() {
        let view = UIView()
        let proxy = LayoutProxy(view: view)
        
        XCTAssertTrue(view.safeAreaLayoutGuide.leadingAnchor === proxy.safeLeading.anchor)
        XCTAssertTrue(view.safeAreaLayoutGuide.trailingAnchor === proxy.safeTrailing.anchor)
        XCTAssertTrue(view.safeAreaLayoutGuide.topAnchor === proxy.safeTop.anchor)
        XCTAssertTrue(view.safeAreaLayoutGuide.bottomAnchor === proxy.safeBottom.anchor)
        
        XCTAssertTrue(view.leadingAnchor === proxy.leading.anchor)
        XCTAssertTrue(view.trailingAnchor === proxy.trailing.anchor)
        XCTAssertTrue(view.topAnchor === proxy.top.anchor)
        XCTAssertTrue(view.bottomAnchor === proxy.bottom.anchor)
        
        XCTAssertTrue(view.widthAnchor === proxy.width.anchor)
        XCTAssertTrue(view.heightAnchor === proxy.height.anchor)
        
        XCTAssertTrue(view.centerXAnchor === proxy.centerX.anchor)
        XCTAssertTrue(view.centerYAnchor === proxy.centerY.anchor)
    }
    
    func testLayoutComputedProperty() {
        let view = UIView()
        let computedProperty = view.layoutProxy
        let proxy = LayoutProxy(view: view)
        
        XCTAssertEqual(computedProperty, proxy)
    }

}
