//
//  UIView+Extension.swift
//  Layout
//
//  Created by Marco Capano on 17/12/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit.UIView

public extension UIView {
    public func layout(using closure: (LayoutProxy) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: self))
    }
    
    public var layoutProxy: LayoutProxy {
        return LayoutProxy(view: self)
    }
    
}
