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

//MARK: - Convenience functions
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
}
