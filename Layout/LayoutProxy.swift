//
//  LayoutProxy.swift
//  Layout
//
//  Created by Marco Capano on 17/12/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit.UIView

///A proxy object that transfers constraints to it's associated view.
public class LayoutProxy: Equatable {
    public lazy var leading = property(with: view.leadingAnchor)
    public lazy var trailing = property(with: view.trailingAnchor)
    public lazy var top = property(with: view.topAnchor)
    public lazy var bottom = property(with: view.bottomAnchor)
    public lazy var width = property(with: view.widthAnchor)
    public lazy var height = property(with: view.heightAnchor)
    public lazy var centerX = property(with: view.centerXAnchor)
    public lazy var centerY = property(with: view.centerYAnchor)
    
    public lazy var safeLeading = property(with: view.safeAreaLayoutGuide.leadingAnchor)
    public lazy var safeTrailing = property(with: view.safeAreaLayoutGuide.trailingAnchor)
    public lazy var safeBottom = property(with: view.safeAreaLayoutGuide.bottomAnchor)
    public lazy var safeTop = property(with: view.safeAreaLayoutGuide.topAnchor)
    
    private let view: UIView
    
    public init(view: UIView) {
        self.view = view
    }
    
    private func property<A: LayoutAnchor>(with anchor: A) -> LayoutProperty<A> {
        return LayoutProperty(anchor: anchor)
    }
    
    public static func ==(lhs: LayoutProxy, rhs: LayoutProxy) -> Bool {
        return lhs.view == rhs.view
    }
}
