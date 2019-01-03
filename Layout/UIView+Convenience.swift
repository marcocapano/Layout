//
//  UIView+Convenience.swift
//  Layout
//
//  Created by Marco Capano on 03/01/2019.
//  Copyright © 2019 Marco Capano. All rights reserved.
//

import UIKit

public extension UIView {
    /// Wraps the receiver inside the given view, with offsets.
    /// If the receiver is not a subview of the given view, it automatically adds it.
    ///
    /// - Parameters:
    ///   - view: The view to wrap into
    ///   - edges: The insets from the "box" edges. Default value is **0**.
    public func box(in view: UIView, edges: UIEdgeInsets = .zero) {
        if isDescendant(of: view) == false {
            view.addSubview(self)
        }
        
        layout { proxy in
            proxy.top == view.topAnchor + edges.top
            proxy.bottom == view.bottomAnchor + edges.bottom
            proxy.leading == view.leadingAnchor + edges.left
            proxy.trailing == view.trailingAnchor + edges.right
        }
    }
    
    /// Constraints the receiver's width and height to given constant values.
    ///
    /// - Parameters:
    ///   - width: The constant width value. No constraint is added when the value is nil.  Default is **nil**.
    ///   - height: The constant height value. No constraint is added when the value is nil.  Default is **nil**.
    public func constraintSize(width: CGFloat? = nil, height: CGFloat? = nil) {
        if let width = width {
            layout { proxy in  proxy.width == width }
        }
        
        if let height = height {
            layout { proxy in proxy.height == height }
        }
    }
    
    /// Centers the receiver on the given view.
    ///
    /// - Parameter view: The view you want to center to.
    public func center(in view: UIView) {
        layout { proxy in
            proxy.centerX == view.centerXAnchor
            proxy.centerY == view.centerYAnchor
        }
    }
}
