//
//  UIView+Extension.swift
//  Layout
//
//  Created by Marco Capano on 17/12/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit.UIView

public extension UIView {
    /// Adds constraints to a the receiver and sets `translatesAutoresizingMaskIntoConstraints`
    /// to **false**.
    ///
    /// - Parameter closure: The closure that defines the constraints.
    public func layout(using closure: (LayoutProxy) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: self))
    }
    
    ///The view's layout proxy. Use this object to add single constraints.
    ///Note that you still need to set `translatesAutoresizingMaskIntoConstraints` to **false**
    ///in order for the constraints to work properly.
    public var layoutProxy: LayoutProxy {
        return LayoutProxy(view: self)
    }
}
